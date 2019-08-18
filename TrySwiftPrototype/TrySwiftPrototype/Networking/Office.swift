//
//  Office.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

struct OfficeOutput: Codable {
    let offices: [Office]
}

struct Office: Codable {
    let id: Int
    let name: String
    let phoneNumber: String
    let hours: String
    let labHours: String
    let directions: String
    let address1: String
    let address2: String
    let city: String
    let state: String
    let zip: String
    let latitude: Float
    let longitude: Float
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case phoneNumber = "phone_number"
        case hours
        case labHours = "lab_hours"
        case directions
        case address1
        case address2
        case city
        case state
        case zip
        case latitude
        case longitude
        case imageURL = "image_url_large"
      }
}
