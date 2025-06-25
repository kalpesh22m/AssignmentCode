//
//  EventViewModel.swift
//  Testapp123
//
//  Created by Kalpesh Mahajan on 25/06/25.
//

import Foundation

@MainActor
class EventViewModel : ObservableObject {
    @Published var isLoading: Bool = false
    var groupedEvents: [String: [HolidayEvent]] = [:]
    @Published var errorMessage: String?
    
    func getEventList() async {
        isLoading = true
        errorMessage = nil
        do {
            let response = try await APIService.sharedInstance.getData()
            let ewEvents = response.englandAndWales.events.map {
                HolidayEvent(title: $0.title, date: $0.date, notes: $0.notes, bunting: $0.bunting, region: "England & Wales")
            }
            let scotlandEvents = response.scotland.events.map {
                HolidayEvent(title: $0.title, date: $0.date, notes: $0.notes, bunting: $0.bunting, region: "Scotland")
            }
            let niEvents = response.northernIreland.events.map {
                HolidayEvent(title: $0.title, date: $0.date, notes: $0.notes, bunting: $0.bunting, region: "Northern Ireland")
            }
            
            let combined = ewEvents + scotlandEvents + niEvents
            
            let grouped = Dictionary(grouping: combined) { $0.region }
            
            self.groupedEvents = grouped
            
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
