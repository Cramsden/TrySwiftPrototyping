//
//  LabResult.swift
//  TrySwiftPrototype
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

struct LabResult: Codable {
    let id: Int
    let status: String
    let title: String
    let collectedAt: Date
    let panels: [Panel]

    enum CodingKeys: String, CodingKey {
        case id
        case status
        case title
        case collectedAt = "collected_at"
        case panels
      }
}

struct Panel: Codable {
    let name: String
    let description: String
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
}
