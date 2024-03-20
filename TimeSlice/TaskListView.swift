//
//  TaskListView.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add New Task")) {
                    HStack {
                        TextField("Enter task title here", text: $newTaskTitle)
                        Button("Add Task") {
                            viewModel.addTask(title: newTaskTitle)
                            newTaskTitle = "" //clears text field for new input
                        }
                        .disabled(newTaskTitle.isEmpty) // requires a title for each task
                    }
                }
                
                Section(header: Text("Your Current Tasks")) {
                    ForEach(viewModel.tasks) { task in
                        NavigationLink(destination: PomodoroTimerView(viewModel: PomodoroTimerViewModel(task: task))) {
                            Text(task.title)
                        }.accessibilityLabel("\(task.title), \(task.isComplete ? "Completed" : "Not completed")")
                    }
                    .onDelete(perform: viewModel.removeTask)
                }
            }
            .navigationBarTitle("TimeSlice Tasks")
        }
    }
}
