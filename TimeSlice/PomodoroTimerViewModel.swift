//
//  PomodoroTimerViewModel.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/19/24.
//

import Foundation
import Combine

class PomodoroTimerViewModel: ObservableObject {
    @Published var workTime: TimeInterval = 25*60
    @Published var breakTime: TimeInterval = 5*60
    @Published var remainingTime: TimeInterval
    @Published var timerActive = false
    @Published var onBreak = false
    
    private var cancellables = Set<AnyCancellable>()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(task: Task) {
        // Initializes the remaining time with the work time for the given task.
        self.remainingTime = workTime

        // Sets up the timer
        setupTimer()
    }
}
