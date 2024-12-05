//
//  ModelContextRepository.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftData

protocol ModelContextProtocol {
    func insert<T: PersistentModel>(_ object: T)
    func delete<T: PersistentModel>(_ object: T)
    func save() throws
    func fetch<T: PersistentModel>(_ descriptor: FetchDescriptor<T>) throws -> [T]
}

/// Extends the default ModelContext to conform to the ModelContextProtocol.
/// This allows for dependency injection and makes it easier to mock the context for testing.
extension ModelContext: ModelContextProtocol {}
