//
//  TaskViewModelTests.swift
//  TimeSliceTests
//
//  Created by Katelyn Zheng on 3/19/24.
//

import XCTest

final class TaskViewModelTests: XCTestCase {
    
    var testViewModel: TaskViewModel!

    override func setUpWithError() throws {
        testViewModel = TaskViewModel()
    }

    override func tearDownWithError() throws {
        testViewModel = nil
    }
    
    func testAddTask() {
        let testTaskTitle = "New Test Task"

        testViewModel.addTask(title: testTaskTitle)
            
        // tests that the task was successfully added to the tasks array
        XCTAssertFalse(testViewModel.tasks.isEmpty, "The tasks array should not be empty after adding a task.")
        XCTAssertEqual(testViewModel.tasks.first?.title, testTaskTitle, "The title of the first task should be the same as what was added.")
    }
    
    func testRemoveTask() {
        // populate the tasks array for testing
        testViewModel.addTask(title: "Task 1")
        testViewModel.addTask(title: "Task 2")
        testViewModel.addTask(title: "Task 3")
        let totalTasks = testViewModel.tasks.count

        testViewModel.removeTask(at: IndexSet(integer: 0))
            
        // tests that the task are removed from the tasks array
        XCTAssertEqual(testViewModel.tasks.count, totalTasks - 1, "The total number of tasks should be one less after removal.")
        XCTAssertNotEqual(testViewModel.tasks.first?.title, "Task 1", "The first task should not be 'Task 1' after it has been removed.")
    }

}
