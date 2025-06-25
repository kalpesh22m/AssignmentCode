//
//  Untitled.swift
//  Testapp123
//
//  Created by Kalpesh Mahajan on 25/06/25.
//

import Foundation

struct RegionHolidays: Decodable {
    let division: String
    let events: [SimpleEvent]
}
