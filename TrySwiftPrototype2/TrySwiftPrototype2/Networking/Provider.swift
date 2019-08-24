//
//  Provider.swift
//  TrySwiftPrototype2
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

struct ProviderOutput: Codable {
    let providers: [Provider]
}

// Codable object representing a Doctor who provides care to this user
struct Provider: Codable, Identifiable {
    let id: Int
    let displayName: String
     // This name maps to an image name in the assets folder
    let profileImageName: String
    // Is primary care provider (is primary doctor)
    let isPCP: Bool
    let bio: String
    let specialty: String

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case profileImageName = "profile_image_name"
        case isPCP = "is_pcp"
        case bio
        case specialty
    }
}
