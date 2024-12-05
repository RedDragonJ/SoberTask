//
//  TaskViewModelTests.swift
//  SoberTaskTests
//
//  Created by James Layton on 12/5/24.
//

import XCTest

final class TaskViewModelTests: XCTestCase {
    var mockContext: MockModelContext!
    var viewModel: TaskViewModel!

    override func setUp() {
        super.setUp()
        mockContext = MockModelContext()
        viewModel = TaskViewModel(modelContextManager: mockContext)
    }

    override func tearDown() {
        mockContext = nil
        viewModel = nil
        super.tearDown()
    }

    func testAddTask() {
        // Given
        let title = "New Task"
        let details = "This is a test task"

        // When
        viewModel.addTask(title: title, details: details)

        // Then
        XCTAssertEqual(mockContext.tasks.count, 1)
        XCTAssertEqual(mockContext.tasks.first?.title, title)
        XCTAssertEqual(mockContext.tasks.first?.details, details)
        XCTAssertFalse(mockContext.tasks.first!.isCompleted)
    }

    func testDeleteTask() {
        // Given
        let task = SoberTask(title: "Task to delete")
        mockContext.insert(task)

        // When
        viewModel.deleteTask(task: task)

        // Then
        XCTAssertTrue(mockContext.tasks.isEmpty)
    }

    func testUpdateTask() {
        // Given
        let task = SoberTask(title: "Original Task")
        mockContext.insert(task)

        // When
        viewModel.updateTask(task: task, newTitle: "Updated Task", newDetails: "Updated details", newIsCompleted: true)

        // Then
        XCTAssertEqual(mockContext.tasks.first?.title, "Updated Task")
        XCTAssertEqual(mockContext.tasks.first?.details, "Updated details")
        XCTAssertTrue(mockContext.tasks.first!.isCompleted)
    }

    func testFetchDataSuccess() {
        // Given
        let task1 = SoberTask(title: "Task 1", isCompleted: false)
        let task2 = SoberTask(title: "Task 2", isCompleted: true)
        mockContext.insert(task1)
        mockContext.insert(task2)

        // When
        viewModel.fetchData()

        // Then
        XCTAssertEqual(viewModel.allTasks.count, 2)
        XCTAssertEqual(viewModel.viewState, .success)
    }

    func testFilterTasksTodo() {
        // Given
        let task1 = SoberTask(title: "Task 1", isCompleted: false)
        let task2 = SoberTask(title: "Task 2", isCompleted: true)
        mockContext.insert(task1)
        mockContext.insert(task2)
        viewModel.fetchData()

        // When
        viewModel.selectedSegment = 0 // TODO segment

        // Then
        XCTAssertEqual(viewModel.filteredTasks.count, 1)
        XCTAssertEqual(viewModel.filteredTasks.first?.title, "Task 1")
    }

    func testFilterTasksCompleted() {
        // Given
        let task1 = SoberTask(title: "Task 1", isCompleted: false)
        let task2 = SoberTask(title: "Task 2", isCompleted: true)
        mockContext.insert(task1)
        mockContext.insert(task2)
        viewModel.fetchData()

        // When
        viewModel.selectedSegment = 1 // COMPLETED segment

        // Then
        XCTAssertEqual(viewModel.filteredTasks.count, 1)
        XCTAssertEqual(viewModel.filteredTasks.first?.title, "Task 2")
    }
}
