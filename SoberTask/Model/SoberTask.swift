//
//  SoberTask.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import Foundation
import SwiftData

@Model
class SoberTask {
    var id: UUID
    var title: String
    var details: String?
    var isCompleted: Bool

    init(title: String, details: String? = nil, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.details = details
        self.isCompleted = isCompleted
    }
}
