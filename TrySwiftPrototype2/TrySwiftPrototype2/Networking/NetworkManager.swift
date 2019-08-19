//
//  NetworkManager.swift
//  TrySwiftPrototype2
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Foundation
import Alamofire

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

