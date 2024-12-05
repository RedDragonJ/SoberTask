//
//  SoberTaskApp.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI
import SwiftData

@main
struct SoberTaskApp: App {
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: SoberTask.self)
        } catch {
            fatalError("Failed to create ModelContainer for SoberTask.")
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TaskListContentView(modelContext: container.mainContext)
            }
        }
        .modelContainer(container)
    }
}
