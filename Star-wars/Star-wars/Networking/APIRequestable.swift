//
//  APIRequestable.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import Foundation

enum HTTPRequestType {
    case get([String: String]? = nil)
    case post([String: String]? = nil, requestBody: Data? = nil)
    case put([String: String]? = nil, requestBody: Data? = nil)
    case delete([String: String]? = nil)

    func getMethod() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

protocol APIRequestable {
    var path: String { get }
    var headers: [String: String] { get }
    var requestType: HTTPRequestType { get }
}
