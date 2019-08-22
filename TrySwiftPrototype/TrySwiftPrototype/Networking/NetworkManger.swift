//
//  NetworkManger.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Foundation
import Alamofire
import Combine

enum NetworkingError: LocalizedError {
    case other
}

struct NetworkManager {
    let session = URLSession.shared
    let decoder = CustomJSONDecoder()

    init() {
        Router.baseURL = URL(string: "http://localhost:8000")
    }

    func fetchProviders() -> AnyPublisher<[Provider], Error> {
        return session.dataTaskPublisher(for: Router.listProviders.urlRequest!).map {
            return $0.data
        }.decode(type: ProviderOutput.self, decoder: decoder).map {
            return $0.providers
        }.eraseToAnyPublisher()
    }

    func fetchLabs() -> AnyPublisher<[LabResult], Error> {
        return session.dataTaskPublisher(for: Router.listLabs.urlRequest!).map {
            return $0.data
        }.decode(type: LabResultOutput.self, decoder: decoder).map {
            return $0.labResults
        }.eraseToAnyPublisher()
    }

    func fetchOffices() -> AnyPublisher<[Office], Error> {
        return session.dataTaskPublisher(for: Router.listOffices.urlRequest!).map {
            return $0.data
        }.decode(type: OfficeOutput.self, decoder: decoder).map {
            return $0.offices
        }.eraseToAnyPublisher()
    }

    func fetchRiskScores() -> AnyPublisher<[RiskScore], Error> {
        return session.dataTaskPublisher(for: Router.listRiskScores.urlRequest!).map {
            return $0.data
        }.decode(type: RiskScoresOutput.self, decoder: decoder).map {
            return $0.riskScores
        }.eraseToAnyPublisher()
    }
}

class CustomJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .iso8601
    }

    func decode<T: Decodable>(_ type: T.Type, from resultMap: [String: Any]) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: resultMap, options: [])
        return try decode(type, from: data)
    }
}

