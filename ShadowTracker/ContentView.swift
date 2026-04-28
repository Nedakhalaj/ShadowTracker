//
//  ContentView.swift
//  ShadowTracker
//
//  Created by neda khalajnejad on 2026-04-25.
//

import SwiftUI
import MapKit
import SwiftData

struct ContentView: View {
    @State private var selectedZoneId: UUID?
    @State private var selectedZone: DropZone?
    @Query() var drops: [DropZone]
    @Environment(\.modelContext) var context
    
    
    var markers: some MapContent {
        ForEach(DropZone.dummyData) { location in
            Marker(location.codeName, coordinate: location.coordinate)
                .tag(location.id)
        }
    }

    var body: some View {
        Map(selection: $selectedZoneId) {
            markers
        }
        .onChange(of: selectedZoneId) { _, newValue in
            selectedZone = DropZone.dummyData.first(where: { $0.id == newValue })
        }
        .sheet(item: $selectedZone) { zone in
            
            NavigationStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(zone.codeName)
                        .font(.title)
                        .bold(true)
                    Text(zone.intel)
                        .font(.body)
                        .foregroundStyle(Color.secondary)
                    NavigationLink("Go to", destination: SecondView())
                }
                .presentationDetents([.medium, .fraction(0.50)])
            }
        }
//        .sheet(isPresented: $showList) {
//            SecondView()
//        }
        .onAppear {
            guard drops.isEmpty else { return }
            for zone in DropZone.dummyData {
                let fresh = DropZone(codeName: zone.codeName, intel: zone.intel, coordinate: zone.coordinate)
                context.insert(fresh)
            }
        }
    }

}


struct SecondView: View {
    @Query() var drops: [DropZone]
    var body: some View {
        List(drops) {drop in
            Text(drop.codeName)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: DropZone.self, inMemory: true)
}
