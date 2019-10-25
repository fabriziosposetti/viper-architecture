//
//  ApiRouter.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 08/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {
    
    case shows
    case episodesFromShow(id: Int)
    case persons(name: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .shows:
            return .get
        case .episodesFromShow:
            return .get
        case .persons:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .shows:
            return "/shows"
        case .episodesFromShow(let id):
            return "/shows/\(id)/episodes"
        case .persons:
            return "/search/people/"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .shows:
            return nil
        case .episodesFromShow:
            return nil
        case .persons:
            return nil
        }
    }
    
    
    // Mark: - QueryItems
    private var queryItems: URLQueryItem? {
        switch self {
        case .shows:
            return nil
        case .episodesFromShow:
            return nil
        case .persons(let name):
            return URLQueryItem(name: "q", value: name)
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: K.baseURL)!
        
        if let queryItems = queryItems {
            urlComponents.queryItems = [queryItems]
        }
        
        let url = try urlComponents.url!.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}

