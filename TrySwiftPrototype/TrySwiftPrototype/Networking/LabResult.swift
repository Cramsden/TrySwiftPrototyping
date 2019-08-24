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

// Codable object representing a lab result for a user, a lab result will have a list of panels that were ordered and each panel will have some number of measurements.
struct LabResult: Codable, Identifiable {
    let id: Int
    // The current status of the lab Uncollected, Pending, Under Review, Reviewed
    let status: String
    let title: String
    let collectedAt: Date
    let orderingProviderID: Int
    // The provider has the ability to flag a lab if the results are concerning or they would like the user to follow up on them
    let isFlagged: Bool
    // Follow up steps
    let followUpNotes: [String]
    // Links for information that the provider would like to share
    let followUpLinks: [String]
    // Provider's interpretation and message to patient
    let interpritation: String
    let panels: [Panel]

    enum CodingKeys: String, CodingKey {
        case id
        case status
        case title
        case collectedAt = "collected_at"
        case orderingProviderID = "ordering_provider_id"
        case isFlagged = "is_flagged"
        case followUpNotes = "follow_up_notes"
        case followUpLinks = "follow_up_links"
        case interpritation
        case panels
      }
}

struct Panel: Codable {
    let name: String
    let measurements: [Measurement]
}

struct Measurement: Codable {
    let name: String
    // The 'expected' range that this measurement should be in to be considered normal. These come from the labs and are usually very conservative
    let referenceRange: ReferenceRange
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name
        case referenceRange = "reference_range"
        case value
    }
}

struct ReferenceRange: Codable {
    let minimum: Int?
    let maximum: Int?

    enum CodingKeys: String, CodingKey {
        case minimum = "min"
        case maximum = "max"
    }
}
