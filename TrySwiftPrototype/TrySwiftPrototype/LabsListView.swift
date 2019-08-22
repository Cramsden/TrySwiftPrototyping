//
//  ContentView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct LabsListView: View {
    @EnvironmentObject private var store: DataStore

    var body: some View {
        NavigationView {

            List(store.labResults) { labResult in
                NavigationLink(destination: LabDetail(labResult: labResult, riskScore: self.store.riskScore(for: labResult), provider: self.store.orderingProvider(on: labResult))) {
                    LabRow(labResult: labResult)
                }
            }.listStyle(GroupedListStyle())
            .onAppear(perform: { self.store.fetch() })
            .navigationBarTitle(Text("Lab Results"))
        }
    }
}

