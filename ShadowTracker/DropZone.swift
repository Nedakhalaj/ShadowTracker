//
//  Untitled.swift
//  ShadowTracker
//
//  Created by neda khalajnejad on 2026-04-25.
//

import Foundation
import MapKit

struct DropZone: Identifiable {
    var id = UUID()
    var codeName: String
    var intel: String
    var coordinate: CLLocationCoordinate2D
}

extension DropZone {
    static let dummyData: [DropZone] = [
        DropZone(
            codeName: "Alpha-7",
            intel: "Misstänkt aktivitet vid norra ingången. Väntar på förstärkning.",
            coordinate: CLLocationCoordinate2D(latitude: 59.3258, longitude: 18.0716) // Gamla Stan, Sthlm
        ),
        DropZone(
            codeName: "Bravo-Tango",
            intel: "Dolt paket under parkbänken. Hämta innan midnatt.",
            coordinate: CLLocationCoordinate2D(latitude: 59.3268, longitude: 18.1145) // Djurgården
        ),
        DropZone(
            codeName: "Charlie-X",
            intel: "Kontaktperson bär röd halsduk. Observera på avstånd.",
            coordinate: CLLocationCoordinate2D(latitude: 59.3150, longitude: 18.0710) // Södermalm
        )
    ]
}
