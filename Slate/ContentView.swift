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
    
    @Query(filter: #Predicate<Task> { !$0.isCompleted }) private var tasks: [Task]
    
    @State private var newTitle: String = ""
    
    @State private var hasDueDate: Bool = false
    
    @State private var newDueDate: Date = Date()
    
    @State private var newPriority: Priority = .normal
    
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
            Toggle("Ajouter une Échéance", isOn: $hasDueDate)
            if hasDueDate {
                DatePicker("Échéance", selection: $newDueDate, displayedComponents: .date)
            }
            Picker("Priorité", selection: $newPriority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue).tag(priority)
                }
            }
            Divider()
            MenuButton(text: "Ajouter une tâche", isDisabled: newTitle.isEmpty) {
                let task = Task(title: newTitle, isCompleted: false, priority: newPriority)
                task.dueDate = hasDueDate ? newDueDate : nil
                context.insert(task)
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
