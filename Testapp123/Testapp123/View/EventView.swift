//
//  ContentView.swift
//  Testapp123
//
//  Created by Kalpesh Mahajan on 25/06/25.
//

import SwiftUI

struct EventView: View {
    @StateObject var viewModel = EventViewModel()
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView().navigationTitle("Event List")
            } else if viewModel.errorMessage != nil {
                Text(viewModel.errorMessage!).navigationTitle("Event List")
            } else {
                List {
                    ForEach(viewModel.groupedEvents.keys.sorted(), id: \.self) { region in
                        Section(header: Text(region)) {
                            ForEach(viewModel.groupedEvents[region] ?? []) { event in
                                    Text(event.title)
                                }
                            }
                        }
                    }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("UK Bank Holidays")
                
            }
        }.task {
            await viewModel.getEventList()
        }
    }
}

#Preview {
    EventView()
}
