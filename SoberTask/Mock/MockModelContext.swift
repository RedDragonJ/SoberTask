//
//  MockModelContext.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftData

class MockModelContext: ModelContextProtocol {
    var tasks: [SoberTask] = []

    func insert<T: PersistentModel>(_ object: T) {
        guard let task = object as? SoberTask else { return }
        tasks.append(task)
    }

    func delete<T: PersistentModel>(_ object: T) {
        guard let task = object as? SoberTask else { return }
        tasks.removeAll { $0.id == task.id }
    }

    func save() throws {
        // Simulate a save without persistence
    }

    func fetch<T: PersistentModel>(_ descriptor: FetchDescriptor<T>) throws -> [T] {
        return tasks as? [T] ?? []
    }
}
