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

struct Provider: Codable, Identifiable {
    let id: Int
    let displayName: String
    let profileImageName: String
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
