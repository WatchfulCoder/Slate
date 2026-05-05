//
//  TaskRowView.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            Text(task.title)
            Spacer()
            Image(systemName: task.priority.icon)
        }
    }
}
