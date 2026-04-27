//
//  Untitled.swift
//  ShadowTracker
//
//  Created by neda khalajnejad on 2026-04-25.
//

import Foundation
import MapKit
import SwiftData

@Model
class DropZone {
    var id = UUID()
    var codeName: String
    var intel: String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
    
    init( codeName: String, intel: String, coordinate: CLLocationCoordinate2D) {
        self.codeName = codeName
        self.intel = intel
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
            }
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
