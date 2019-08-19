//
//  LabResult.swift
//  TrySwiftPrototype2
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Foundation

struct LabResultOutput: Codable {
    let labResults: [LabResult]

    enum CodingKeys: String, CodingKey {
        case labResults = "lab_results"
    }
}

struct LabResult: Codable, Identifiable {
    let id: Int
    let status: String
    let title: String
    let collectedAt: Date
    let orderingProviderID: Int
    let panels: [Panel]

    enum CodingKeys: String, CodingKey {
        case id
        case status
        case title
        case collectedAt = "collected_at"
        case orderingProviderID = "ordering_provider_id"
        case panels
      }
}

struct Panel: Codable {
    let name: String
//    let description: String
    let measurements: [Measurement]
}

struct Measurement: Codable {
    let name: String
    let referenceRange: ReferenceRange
    let value: Int
    let interpritation: String

    enum CodingKeys: String, CodingKey {
        case name
        case referenceRange = "reference_range"
        case value
        case interpritation
    }
}

struct ReferenceRange: Codable {
    let minimum: Int
    let maximum: Int

    enum CodingKeys: String, CodingKey {
        case minimum = "min"
        case maximum = "max"
    }
}
