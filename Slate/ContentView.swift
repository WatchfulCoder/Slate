//
//  ContentView.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    private var remainingTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    var body: some View {
        VStack {
            HStack {
                Text("Tâches")
                Spacer()
                Text("\(remainingTasksCount) restantes")
            }
            List($tasks) { $task in
                TaskRowView(task: $task)
            }
            Button("Ajouter une tâche") {
                tasks.append(Task(title: "New task", isCompleted: false, priority: "normal"))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
