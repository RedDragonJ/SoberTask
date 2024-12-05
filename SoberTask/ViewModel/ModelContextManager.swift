//
//  ModelContextManager.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftData

class ModelContextManager: ModelContextProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func insert<T: PersistentModel>(_ object: T) {
        modelContext.insert(object)
    }

    func delete<T: PersistentModel>(_ object: T) {
        modelContext.delete(object)
    }

    func save() throws {
        try modelContext.save()
    }

    func fetch<T: PersistentModel>(_ descriptor: FetchDescriptor<T>) throws -> [T] {
        try modelContext.fetch(descriptor)
    }
}
