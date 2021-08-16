//
//  ApiService.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation
import Alamofire
import PromiseKit

final class ApiService {
    static let manager = ApiService()

    fileprivate var alamofireManager: Alamofire.Session

    init() {
        let configuration = URLSessionConfiguration.default
        alamofireManager = Alamofire.Session(configuration: configuration)
    }

    func getMurlocs() -> Promise<[Card]> {
        return Promise { resolver in

            alamofireManager.request(ApiRouter.getMurlocs).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let launches = try decoder.decode([Card].self, from: data)
                        resolver.fulfill(launches)
                    } catch {
                        resolver.reject(error)
                    }
                case .failure(let error):
                    resolver.reject(error)
                }
            }
        }
    }
}

