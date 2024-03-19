//
//  TimeSliceTests.swift
//  TimeSliceTests
//
//  Created by Katelyn Zheng on 3/18/24.
//

import XCTest
@testable import TimeSlice

final class TimeSliceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitializeTask() {
        // Test that the default value of isComplete is false
        var test_task = Task(title:"Test Task")
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
