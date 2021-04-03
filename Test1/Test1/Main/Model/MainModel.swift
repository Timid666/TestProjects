//
//  Model.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import Foundation

struct BugTruckers: Decodable {
    let bugTruckers: [Trucker]
    enum CodingKeys: String, CodingKey {
        case bugTruckers = "bug_trackers"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.bugTruckers = try container.decode([Trucker].self, forKey: .bugTruckers)
    }
}

struct Trucker: Decodable {
    let id: Int
    let name: String
    let description: String
}
