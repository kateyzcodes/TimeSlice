//
//  Task.swift
//  TimeSlice
//
//  Created by Katelyn Zheng on 3/19/24.
//

import Foundation
struct Task:Identifiable {
    let id: UUID
    var title: String
    var isComplete: Bool
    
    init(id: UUID, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    /*
    method to toggle complete status for a Task
    if isComplete == true and isComplete.toggle() -> isComplete == false
    if isComplete == false and isComplete.toggle() -> isComplete == true
    */
    mutating func toggleIsComplete(){
        isComplete.toggle()
    }
    
    
    
}
