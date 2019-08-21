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

struct NM {
    let session = URLSession.shared
    let decoder = CustomJSONDecoder()

    init() {
        Router.baseURL = URL(string: "http://localhost:8000")
    }

    func fetchProviders() -> AnyPublisher<[Provider], Error> {
        return session.dataTaskPublisher(for: Router.listProviders.urlRequest!).map {
            print($0.response)
            return $0.data
        }.decode(type: ProviderOutput.self, decoder: decoder).map {
            print("in herrree")
            return $0.providers
        }.mapError {
            print("error \($0.localizedDescription)")
            return $0
        }
        .eraseToAnyPublisher()
    }

    func fetchLabs() -> AnyPublisher<[LabResult], Error> {
        return session.dataTaskPublisher(for: Router.listLabs.urlRequest!).map {
            print($0.response)
            return $0.data
        }.decode(type: LabResultOutput.self, decoder: decoder).map {
            print("in herrree")
            return $0.labResults
        }.mapError {
            print("error \($0.localizedDescription)")
            return $0
        }
        .eraseToAnyPublisher()
    }
}

class NetworkManager {

    init() {
        Router.baseURL = URL(string: "http://localhost:8000")
    }

    func fetchProviders(completion: @escaping (Error?, [Provider]) -> ()) {
        makeCodableRequest(with: .listProviders, ofType: ProviderOutput.self) { (error, providerOutput) in
            if let error = error {
                completion(error, [])
            } else {
                completion(nil, providerOutput?.providers ?? [])
            }
        }
    }

    func fetchOffices(completion: @escaping (Error?, [Office]) -> ()) {
        makeCodableRequest(with: .listOffices, ofType: OfficeOutput.self) { (error, officeOutput) in
            if let error = error {
                completion(error, [])
            } else {
                completion(nil, officeOutput?.offices ?? [])
            }
        }
    }

    func fetchLabs(completion: @escaping (Error?, [LabResult]) -> ()) {
         makeCodableRequest(with: .listLabs, ofType: LabResultOutput.self) { (error, labResultsOutput) in
            if let error = error {
                completion(error, [])
            } else {
                completion(nil, labResultsOutput?.labResults ?? [])
            }
        }
    }

    func fetchRiskScores(completion: @escaping (Error?, [RiskScore]) -> ()) {
         makeCodableRequest(with: .listRiskScores, ofType: RiskScoresOutput.self) { (error, riskScoresOutput) in
            if let error = error {
                completion(error, [])
            } else {
                completion(nil, riskScoresOutput?.riskScores ?? [])
            }
        }
    }

    private func makeCodableRequest<T: Codable>(with route: Router, ofType type: T.Type, completion: @escaping (Error?, T?) -> ()) {
        Alamofire.request(route).validate().responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                do {
                    guard let result = dataResponse.result.value else {
                        completion(nil, nil)
                        return
                    }

                    let output = try  CustomJSONDecoder().decode(T.self, from: result)
                    completion(nil, output)
                } catch {
                    completion(error, nil)
                }
            case .failure(let error):
                completion(error, nil)
            }
        }
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

