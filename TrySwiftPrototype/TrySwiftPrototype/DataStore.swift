//
//  DataStore.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var providers: [Provider] = []
    @Published var offices: [Office] = []
    @Published var labResults: [LabResult] = []
    @Published var riskScores: [RiskScore] = []

    lazy var networkManager: NetworkManager = {
        return NetworkManager()
    }()

    private var providerPublisher: AnyCancellable?
    private var labPublisher: AnyPublisher<[LabResult], Error>?
    private var officePublisher: AnyCancellable?
    private var riskScorePublisher: AnyPublisher<[RiskScore], Error>?
    private var combinedLabPublishers: AnyCancellable?

    func fetch() {
        providerPublisher = networkManager.fetchProviders().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let anError):
                    print("received error: ", anError)
                }
            }, receiveValue: { providers in
                self.providers = providers
            })

        labPublisher = networkManager.fetchLabs()
        riskScorePublisher =  networkManager.fetchRiskScores()

        combinedLabPublishers = Publishers.Zip(labPublisher!, riskScorePublisher!).receive(on: DispatchQueue.main).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let anError):
                print("received error: ", anError)
            }
        }, receiveValue: { results in
            self.labResults = results.0
            self.riskScores = results.1
        })

        officePublisher = networkManager.fetchOffices().receive(on: DispatchQueue.main).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let anError):
                print("received error: ", anError)
            }
        }, receiveValue: { offices in
            self.offices = offices
        })
    }
}
