//
//  PomodoroTimerView.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import Foundation
import SwiftUI

struct PomodoroTimerView: View {
    var task: Task
    @ObservedObject var viewModel: PomodoroTimerViewModel

    var body: some View {
        Text("Timer for \(task.title)")
        
            // Alerts user when onBreak is toggled, depending on state of onBreak
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.alertTitle))
            }
    }
    
}
