//
//  TaskListView.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import Foundation
import SwiftUI

struct TaskListView: View{
    @State private var tasks: [Task] = []
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Add New Task")) {
                    HStack {
                        TextField("", text: $newTaskTitle)
                        Button(action: addTask) {
                            Image(systemName: "plus.circle.fill").accessibilityLabel("Add new task")
                        }.disabled(newTaskTitle.isEmpty) // requires a title for each task
                    }
                }
                
                Section(header: Text("Your Current Tasks")) {
                    ForEach(tasks) {
                        task in NavigationLink(destination: PomodoroTimerView(task: task)){
                            Text(task.title)
                        }.accessibilityLabel("\(task.title), \(task.isComplete ? "Completed" : "Not completed")")
                    }.onDelete(perform: removeTask)
                }
            }
            .navigationBarTitle("TimeSlice")
        }
    }
    
    // adds new task to tasks array that is used to display list of tasks
    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = "" // clears text field for new input
    }
    
    // removes task from tasks array that is used to display list of tasks
    private func removeTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
