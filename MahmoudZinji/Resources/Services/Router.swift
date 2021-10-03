//
//  Router.swift
//  Twa
//
//  Created by Sam Kadri on 04/05/2021.
//

import Foundation  
import Alamofire

enum Router:URLRequestConvertible{
    // 1.
    case getHomePageData

    // 2.
    var schema:String{
        return "http"
    }
    
    // 3.
    var host: String {
        return "testtask.solidtechapps.com"
    }
    
    // 4.
    var path: String {
      switch self {
      case .getHomePageData:
            return "/api/v1/response/"
        }
    }
    
    // 7.
    var method: String {
        switch self {
        case .getHomePageData:
            return "GET"
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        switch self {

        case .getHomePageData:
            let request = createBaseRequest()
            return try JSONEncoding.default.encode(request)
        }
    }
    
    func createBaseRequest(queryParamers:[String:String]=[:]) -> URLRequest {
        
        var components = URLComponents()
        components.scheme = self.schema
        components.host = self.host
        components.path = self.path

        
        var urlRequest = URLRequest(url: components.url!)
 
        urlRequest.timeoutInterval = 25
        urlRequest.httpMethod = self.method
        
        print(urlRequest)
        return urlRequest
    }
    
    func json(from object:Any) -> String? {
         guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
             return nil
         }
         return String(data: data, encoding: String.Encoding.utf8)
     }

}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
