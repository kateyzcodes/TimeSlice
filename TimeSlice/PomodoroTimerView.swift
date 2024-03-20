//
//  PomodoroTimerView.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import Foundation
import SwiftUI

struct PomodoroTimerView: View {
//    var task: Task
    @ObservedObject var viewModel: PomodoroTimerViewModel

    var body: some View {
//        Text("Timer for \(task.title)")
        VStack {
            Text("Time for \(viewModel.onBreak ? "a well-deserved break" : "work")!").font(.title)

            Text(formatTime(viewModel.remainingTime)).font(.largeTitle)

            // Button to pause/start timer
            Button(action: {
                viewModel.startPauseTimer()
            }) {
                Text(viewModel.isActive ? "Pause" : "Start")
            }.padding()

            // Button to reset timer
            Button("Reset") {
                viewModel.resetTimer()
            }.padding()
        }
        // Alerts user when onBreak is toggled, depending on state of onBreak
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.alertTitle))
        }
    }

    // Formats time for the timer
    private func formatTime(_ totalSeconds: TimeInterval) -> String {
        let minutes = Int(totalSeconds) / 60
        let seconds = Int(totalSeconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
