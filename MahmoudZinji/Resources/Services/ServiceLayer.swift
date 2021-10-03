//
//  ServiceLayer.swift
//  Twa
//
//  Created by Sam Kadri on 04/05/2021.
//

import Foundation  
import ObjectMapper
import Alamofire

class ServiceLayer {
    
    class func request<T: Mappable>(router: Router, completion: @escaping (Result<BaseModel<T>, Error>) -> ()) {
        
        do{
            ServiceLayerApiConfig.shared.session.request(try router.asURLRequest()).validate().responseData { (data) in
                print(data)
                let result = data.result
                
                switch result{
                case .success(let data):
                    do {
                        print(String.init(data: data, encoding: .utf8))
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            let object = Mapper<BaseModel<T>>().map(JSON: json)
                            completion(.success(object!))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                    break
                case .failure(let error):
                    completion(.failure(error))
                    break
                }
            }
        }catch{
            print(error.localizedDescription)
        }
       
    }
}

class ServiceLayerApiConfig: NSObject {

    static var shared = ServiceLayerApiConfig()
    var session:Session!

    private override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        session = Alamofire.Session(configuration:configuration,interceptor: RequestInterceptor(token: ""))
    }
}
