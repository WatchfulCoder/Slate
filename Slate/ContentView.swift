//
//  ContentView.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [Task]
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
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            List(tasks) { task in
                TaskRowView(task: task)
            }
            TextField("Nouvelle tâche", text: $newTitle)
            Divider()
            MenuButton(text: "Ajouter une tâche", isDisabled: newTitle.isEmpty) {
                context.insert(Task(title: newTitle, isCompleted: false, priority: .normal))
                    newTitle = ""
                }
            Divider()
            MenuButton(text: "Quitter") {
                NSApp.terminate(nil)
            }
            
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 8)
        .frame(width: 350, height: 400)
    }
}

#Preview {
    ContentView()
}
