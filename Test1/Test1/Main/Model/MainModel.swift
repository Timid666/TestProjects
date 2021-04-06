//
//  Model.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import Foundation

struct BugTruckers: Decodable {
    var bugTruckers: [Trucker]
    var totalPages: Int = 0
    var bugTrackersCount: Int = 0
    enum CodingKeys: String, CodingKey {
        case bugTruckers = "bug_trackers"
        case totalPages = "totalPages"
        case bugTrackersCount = "bug_trackers_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bugTruckers = try container.decode([Trucker].self, forKey: .bugTruckers)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.bugTrackersCount = try container.decode(Int.self, forKey: .bugTrackersCount)
    }
}

struct Trucker: Decodable {
    let id: Int
    let name: String
    let description: String
}
