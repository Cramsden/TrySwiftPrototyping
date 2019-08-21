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

    func fetch() {
        let publisher = NM().fetchProviders()
        _ = publisher.sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("finished")
                        break
                    case .failure(let anError):
                        print("received error: ", anError)
                }
        }, receiveValue: { providers in
            print(providers)
            self.providers = providers
        })

        let labPub = NM().fetchLabs()
        _ = labPub.sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("finished")
                        break
                    case .failure(let anError):
                        print("received error: ", anError)
                }
        }, receiveValue: { labResults in
            print(labResults)
            self.labResults = labResults
        })

//        networkManager.fetchLabs { (error, labResults) in
//            self.labResults = labResults
//        }

        networkManager.fetchOffices { (error, offices) in
            self.offices = offices
        }

//        networkManager.fetchProviders { (error, providers) in
//            self.providers = providers
//        }

        networkManager.fetchRiskScores { (error, riskScores) in
            self.riskScores = riskScores
        }
    }
}
