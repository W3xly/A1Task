//
//  ApiRouter.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation
import Alamofire

typealias JSONDictionary = [String: Any]

enum ApiRouter: URLRequestConvertible {

    private static let baseURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/"

    case getMurlocs

    var method: HTTPMethod {
        switch self {
        case .getMurlocs:
            return .get
        }
    }

    func asURLRequest() throws -> URLRequest {

        let path: String = {
            switch self {
            case .getMurlocs:
                return "cards/races/murloc"
            }
        }()

        let url = try ApiRouter.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        // Headers
        urlRequest.setValue(rapidApiKeyHeader.value, forHTTPHeaderField: rapidApiKeyHeader.key)
        urlRequest.setValue(rapidApiHostHeader.value, forHTTPHeaderField: rapidApiHostHeader.key)

        return urlRequest
    }
}
