//
//  Untitled.swift
//  Testapp123
//
//  Created by Kalpesh Mahajan on 25/06/25.
//

import Foundation

struct BankHolidaysResponse: Decodable {
    let englandAndWales: RegionHolidays
    let scotland: RegionHolidays
    let northernIreland: RegionHolidays

    enum CodingKeys: String, CodingKey {
        case englandAndWales = "england-and-wales"
        case scotland
        case northernIreland = "northern-ireland"
    }
}
