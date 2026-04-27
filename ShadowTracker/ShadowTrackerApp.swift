//
//  ShadowTrackerApp.swift
//  ShadowTracker
//
//  Created by neda khalajnejad on 2026-04-25.
//

import SwiftUI
import SwiftData

@main
struct ShadowTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: DropZone.self)
        }
    }
}
