//
//  AdmissioniOSApp.swift
//  AdmissioniOS
//
//  Created by Simon Benjamin on 10/10/24.
//
import SwiftUI
import SwiftData

@main
struct AdmissioniOSApp: App {
    
    @State private var modelData = ModelData()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(modelData)
        }
        .modelContainer(sharedModelContainer)
    }
}
