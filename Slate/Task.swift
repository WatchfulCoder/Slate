//
//  Task.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//
import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: String
}
