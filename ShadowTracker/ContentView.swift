//
//  ContentView.swift
//  ShadowTracker
//
//  Created by neda khalajnejad on 2026-04-25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedZoneId: UUID?
    @State private var selectedZone: DropZone?
    
    var body: some View {
            Map(selection: $selectedZoneId){
                ForEach(DropZone.dummyData){location in
                    Marker(location.codeName,coordinate: location.coordinate)
                        .tag(location.id)
                    
                }
            }
            .onChange(of: selectedZoneId) { _, newValue in
               selectedZone = DropZone.dummyData.first(where: { $0.id == newValue })
            }
            .sheet(item: $selectedZone){zone in
                VStack(alignment: .leading,spacing: 12){
                    Text(zone.codeName)
                        .font(.title)
                        .bold(true)
                    Text(zone.intel)
                        .font(.body)
                        .foregroundStyle(Color.secondary)
                }
                .padding()
                .presentationDetents([.medium, .fraction(0.25)])
            }
            
            
            
            
        
        
    }
}

#Preview {
    ContentView()
}
