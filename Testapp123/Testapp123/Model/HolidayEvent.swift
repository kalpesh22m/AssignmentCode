//
//  Untitled.swift
//  Testapp123
//
//  Created by Kalpesh Mahajan on 25/06/25.
//

import Foundation

struct HolidayEvent: Identifiable {
    var id: String { region + date + title }

    let title: String
    let date: String
    let notes: String
    let bunting: Bool
    let region: String
}
