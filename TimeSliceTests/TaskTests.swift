//
//  TaskTests.swift
//  TimeSliceTests
//
//  Created by Katelyn Zheng on 3/18/24.
//

import XCTest

final class TaskTests: XCTestCase {
    
    var test_task: Task!

    override func setUpWithError() throws {
        test_task = Task(title:"Test Task")
    }

    override func tearDownWithError() throws {
        test_task = nil
    }

    func testInitializeTask() {
        // Test that the default value of isComplete is false
        XCTAssertEqual(test_task.title, "Test Task")
        XCTAssertFalse(test_task.isComplete, "Task should be marked as not complete by default.")
    }
    
    func testToggleIsComplete() {
        // Create and assert that the initial value of isComplete is false before testing
        var test_task = Task(title:"Test Task")
        XCTAssertFalse(test_task.isComplete, "Task should be marked as not complete by default.")
        
        // Test that toggling isComplete from false to true works
        test_task.toggleIsComplete()
        XCTAssertTrue(test_task.isComplete, "Task should be marked as complete after toggling from not complete.")
        
        // Test that toggling isComplete from true to false works
        test_task.toggleIsComplete()
        XCTAssertFalse(test_task.isComplete, "Task should be marked as not complete after toggling from complete.")
    }

}
