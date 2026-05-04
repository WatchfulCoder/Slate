//
//  ContentView.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    var body: some View {
        VStack {
            HStack {
                Text("Tâches")
                Spacer()
                Text("\(tasks.count) restantes")
            }
            List(tasks) { task in
                    Text(task.title)
            }
            Button("Click here") {
                tasks.append(Task(title: "New task", isCompleted: false, priority: "normal"))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
