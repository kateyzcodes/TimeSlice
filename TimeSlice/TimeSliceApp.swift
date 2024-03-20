//
//  TimeSliceApp.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import SwiftUI
import SwiftData

@main
struct TimeSliceApp: App {
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
//            ContentView()
              TaskListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
