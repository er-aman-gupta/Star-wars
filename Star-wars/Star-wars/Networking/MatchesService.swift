//
//  MatchesService.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import Foundation

enum MatchRequest: APIRequestable {
    case getMatches

    var path: String {
        switch self {
        case .getMatches:
            "https://www.jsonkeeper.com/b/4YJQ"
        }
    }

    var headers: [String : String] {
        [:]
    }

    var requestType: HTTPRequestType {
        switch self {
        case .getMatches:
            return .get()
        }
    }
}


struct MatchesService {
    func getMatches(completion: @escaping (Result<[MatchesModel], Error>) -> Void) {
        let request = MatchRequest.getMatches
        apiService.callAPI(request: request, completion: completion)
    }
}
