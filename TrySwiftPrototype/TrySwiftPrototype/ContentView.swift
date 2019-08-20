//
//  ContentView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: DataStore

    var body: some View {
        NavigationView {
            List(store.labResults) { labResult in
                VStack(alignment: .leading) {
                    Text(labResult.title)
                        .font(.headline)
                    Text(labResult.status)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .onAppear(perform: { self.store.fetch() })
            .navigationBarTitle(Text("Labs"))
        }
    }
}

