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

final class DataStore: ObservableObject {
    @Published var providers: [Provider] = []
    @Published var offices: [Office] = []
    @Published var labResults: [LabResult] = []

    func fetch() {
        let networkManager = NetworkManager()
        networkManager.fetchLabs { (error, labResults) in
            self.labResults = labResults
        }

        networkManager.fetchOffices { (error, offices) in
            self.offices = offices
        }

        networkManager.fetchProviders { (error, providers) in
            self.providers = providers
        }
    }
}
