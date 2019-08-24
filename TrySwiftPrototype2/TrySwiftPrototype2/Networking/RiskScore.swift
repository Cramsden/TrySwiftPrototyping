//
//  RiskScore.swift
//  TrySwiftPrototype2
//
//  Created by Carson Ramsden on 8/20/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Foundation

struct RiskScoresOutput: Codable {
    let riskScores: [RiskScore]
    enum CodingKeys: String, CodingKey {
        case riskScores = "risk_scores"
    }
}

// Codable object representing the risk score of a specific lab
struct RiskScore: Codable, Identifiable {
    let id: Int
    let labID: Int
     // Calculated risk score based on patient's age, information, and their lab results
    let riskScore: Int
    // Calculated new risk score if they were to start on a normal dose of Statin, a cholestorol lowering drug
    let riskScoreWithMeds: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case labID = "lab_id"
        case riskScore = "risk_score"
        case riskScoreWithMeds = "with_medication"
    }
}
