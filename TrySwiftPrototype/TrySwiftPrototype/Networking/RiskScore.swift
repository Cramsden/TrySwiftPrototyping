//
//  RiskScore.swift
//  TrySwiftPrototype
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

struct RiskScore: Hashable,  Codable, Identifiable {
    let id: Int
    let labID: Int
    let riskScore: Int
    let riskScoreWithMeds: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case labID = "lab_id"
        case riskScore = "risk_score"
        case riskScoreWithMeds = "with_medicaiton"
    }
}
