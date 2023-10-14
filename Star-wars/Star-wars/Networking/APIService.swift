//
//  APIService.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import Foundation

enum NetworkingError: Error {
    case invalidRequest
    case parsingError
    case unknownError
    case unauthorized
}

struct APIService {

    let session = URLSession.shared

    func callAPI<Response: Decodable>(request: APIRequestable, completion: @escaping (Result<Response, Error>) -> Void) {
        guard let urlRequest = getURLRequest(from: request) else {
            completion(.failure(NetworkingError.invalidRequest))
            return
        }
        let task = session.dataTask(with: urlRequest) { responseData, urlResponse, error in
            if let error = error as? NSError {
                completion(.failure(error))
                return
            }

            let acceptableHTTPCodes = (200...399)
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode

            if let statusCode,
               acceptableHTTPCodes.contains(statusCode),
               let responseData {
                do {
                    let jsonDecoder = JSONDecoder()
                    let parsedData = try jsonDecoder.decode(Response.self, from: responseData)
                    completion(.success(parsedData))
                } catch {
                    completion(.failure(NetworkingError.parsingError))
                }
            } else if statusCode == 401 {
                completion(.failure(NetworkingError.unauthorized))
            } else {
                completion(.failure(NetworkingError.unknownError))
            }
        }
        task.resume()
    }

    private func getURLRequest(from request: APIRequestable) -> URLRequest? {
        var components = URLComponents(string: request.path)
        var params: [String: String]?
        var requestBody: Data?
        switch request.requestType {
        case .delete(let queryParams),
                .get(let queryParams):
            params = queryParams
        case .post(let queryParams, let body),
                .put(let queryParams, let body):
            params = queryParams
            requestBody = body
        }
        components?.queryItems = params?.map({ URLQueryItem(name: $0.key, value: $0.value) })
        guard let url = components?.url else { return nil }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.requestType.getMethod()
        urlRequest.httpBody = requestBody
        urlRequest.allHTTPHeaderFields = request.headers
        return urlRequest
    }

}
