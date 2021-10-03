//
//  RequestInterceptor.swift
//  Storzati
//
//  Created by User on 04/05/2021.
//

import UIKit
import Alamofire
import SwifterSwift
import SwiftUI
import Foundation

final class RequestInterceptor: Alamofire.RequestInterceptor {
    
    var currentURL : String!
    init(token: String) {
        
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        //fullURL
        guard let _ =  urlRequest.url?.absoluteString else {
            return completion(.success(urlRequest))
        }
        
        var urlRequest = urlRequest
        /// Set the Authorization header value using the access token.
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            /// The request did not fail due to a 401 Unauthorized response.
            /// Return the original error and don't retry the request.
            
            //any other request than 401
            
            if self.currentURL == request.request?.url?.absoluteString {
                self.currentURL = nil
                completion(.doNotRetry)
                return
            }
            
            if let responseData = (request as? DataRequest)?.data {
                self.handleErrorResponseResponse(request: request, data: responseData)
                self.currentURL = request.request?.url?.absoluteString
            }
            completion(.doNotRetry)
            return
        }
        
        
        if ((request.request?.url?.absoluteString.contains("testtask.solidtechapps.com") ?? false) && response.statusCode == 401) {
            
            if let responseData = (request as? DataRequest)?.data {
                self.handleErrorResponseResponse(request: request, data: responseData)
                self.currentURL = request.request?.url?.absoluteString
            }
            completion(.doNotRetry)
            return
        }
    }
    
    private func handleErrorResponseResponse(request:Request,data:Data){
        
    }
    
    private func handleErrorCode(errorCode : Int, code:Int, message : String) {
        
        switch code {
        case 34:
            print(code)
        default:
            print(code)
        }
    }
    
    func discardShowingAlertForSomeAPI(fullURL:String,completion:((Bool)->())){
        switch fullURL {
        case let str where str.lowercased().contains("unseen"):
            completion(true)
            break
        default:
            completion(false)
            break
        }
    }
}

struct IdentityError: Codable {
    var title:String?
    var status:String?
    var result:IdentityErrorCode
}

struct IdentityErrorCode:Codable{
    var code:Int
    var message:String?
}

struct ErrorModal: Codable {
    var action:Int?
    var status:Int?
    var message:String?
    var developerMessage:String?
    var error : String?
    var details : String?
    var reason : String?
}
