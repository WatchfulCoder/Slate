//
//  ContentView.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTitle: String = ""
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
            TextField("Nouvelle tâche", text: $newTitle)
            Button("Ajouter une tâche") {
                tasks.append(Task(title: newTitle, isCompleted: false, priority: .normal))
                newTitle = ""
            }
            .disabled(newTitle.isEmpty)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
