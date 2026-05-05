//
//  Task.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: Priority
    var dueDate: Date?
    
    init(title: String, isCompleted: Bool, priority: Priority) {
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
    }
}
