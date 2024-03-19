//
//  Task.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/18/24.
//

import Foundation
struct Task:Identifiable {
    let id: UUID
    var title: String
    var isComplete: Bool
    
    /*
     id is uniquely generated on creation of an instance of Task
     isComplete is false by default (makes no sense to add a completed task)
    */
    init(title: String, isComplete: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
    }
    
    /*
    Toggle complete status for a Task
    if isComplete == true and isComplete.toggle() -> isComplete == false
    if isComplete == false and isComplete.toggle() -> isComplete == true
    */
    mutating func toggleIsComplete(){
        isComplete.toggle()
    }
    
}
