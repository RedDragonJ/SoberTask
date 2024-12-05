//
//  TaskViewModel.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import Foundation
import SwiftData

@Observable
class TaskViewModel {
    var modelContextManager: ModelContextProtocol
    var allTasks: [SoberTask] = []
    var filteredTasks: [SoberTask] = []
    var selectedSegment: Int = 0 {
        didSet {
            filterTasks()
        }
    }
    var viewState: ViewState = .loading

    init(modelContextManager: ModelContextProtocol) {
        self.modelContextManager = modelContextManager
    }

    func addTask(title: String, details: String? = nil) {
        let newTask = SoberTask(title: title, details: details, isCompleted: false)
        modelContextManager.insert(newTask)
        saveContext()
    }

    func deleteTask(task: SoberTask) {
        modelContextManager.delete(task)
        saveContext()
    }

    func updateTask(task: SoberTask, newTitle: String, newDetails: String? = nil, newIsCompleted: Bool) {
        task.title = newTitle
        if let newDetails {
            task.details = newDetails
        }
        task.isCompleted = newIsCompleted
        saveContext()
    }

    func fetchData() {
        do {
            viewState = .loading
            let descriptor = FetchDescriptor<SoberTask>(sortBy: [SortDescriptor(\.title)])
            allTasks = try modelContextManager.fetch(descriptor)

            if !allTasks.isEmpty {
                filterTasks()
                viewState = .success
            }

        } catch {
            print("Fetch failed: \(error)") // Should log the error to somewhere and use a better error handler
            viewState = .error(error.localizedDescription)
        }
    }

    private func filterTasks() {
        switch selectedSegment {
        case 0:
            filteredTasks = allTasks.filter { !$0.isCompleted }
        case 1:
            filteredTasks = allTasks.filter { $0.isCompleted }
        default:
            filteredTasks = allTasks
        }
    }

    private func saveContext() {
        do {
            try modelContextManager.save()
            fetchData()
        } catch {
            print("Save failed: \(error)") // Should log the error to somewhere and use a better error handler
            viewState = .error(error.localizedDescription)
        }
    }
}
