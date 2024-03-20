//
//  PomodoroTimerViewModel.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import Foundation
import Combine

class PomodoroTimerViewModel: ObservableObject {
    @Published var workTime: TimeInterval = 25*60
    @Published var breakTime: TimeInterval = 5*60
    @Published var remainingTime: TimeInterval
    
    @Published var isActive = false
    @Published var onBreak = false
    
    @Published var showAlert = false
    @Published var alertTitle = ""
    
    private var cancellables = Set<AnyCancellable>()
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    init(task: Task) {
        // Initializes times with default times for Pomodoro
        self.workTime = 25*60
        self.breakTime = 5*60
        self.remainingTime = 25*60 // Starts out equal to workTime

        // Sets up the timer
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        setupTimer()
    }
    
    private func setupTimer() {
        timer.sink {
            [weak self] _ in
                guard let self = self else { return } // Does nothing if self cannot be unwrapped safely
                    guard self.isActive else { return } // Does nothing if timer is not active
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    } 
                    else { // Handles timer when it completes a cycle
                        self.isActive = false
                        self.onBreak.toggle()
                        self.remainingTime = self.onBreak ? self.breakTime : self.workTime
                        // Sets the alert properties and shows alert depending on on break status
                        self.alertTitle = self.onBreak ? "Time for a nice break!" : "Back to keeping your heart in the work!"
                        self.showAlert = true
                    }
        }.store(in: &cancellables)
    }
    
    // Toggles the active status (start/pause) of the timer
    func startPauseTimer() {
        isActive.toggle()
    }
    
    // Resets the timer back to the beginning of a work session
    func resetTimer() {
        isActive = false
        onBreak = false
        remainingTime = workTime
    }
}
