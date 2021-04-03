//
//  DetailMode.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import Foundation

struct TruckerDetail: Decodable {
    var bugTrucker: TruckerDetailModel
    
    enum CodingKeys: String, CodingKey {
        case bugTrucker = "bug_tracker"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.bugTrucker = try container.decode(TruckerDetailModel.self, forKey: .bugTrucker)
    }
}

struct TruckerDetailModel: Decodable {
    let name: String
    let description: String
    let product: String
    let additionalData: Gadjet
}

struct Gadjet: Decodable {
    let Device: String
    let OsType: String
    let OsVersion: String
}
