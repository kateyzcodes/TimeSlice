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

    var body: some View {
        Text("Timer for \(task.title)")
    }
}
