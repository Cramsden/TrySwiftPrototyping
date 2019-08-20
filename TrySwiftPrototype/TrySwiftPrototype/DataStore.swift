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
        networkManager.fetchLabs { (error, labResults) in
            self.labResults = labResults
        }

        networkManager.fetchOffices { (error, offices) in
            self.offices = offices
        }

        networkManager.fetchProviders { (error, providers) in
            self.providers = providers
        }

        networkManager.fetchRiskScores { (error, riskScores) in
            self.riskScores = riskScores
        }
    }
}
