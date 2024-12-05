//
//  TaskList.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI
import SwiftData

struct TaskListContentView: View {
    @State private var taskVM: TaskViewModel
    @State private var showAddTaskView = false

    init(modelContext: ModelContext) {
        let modelContextManager = ModelContextManager(modelContext: modelContext)
        _taskVM = State(initialValue: TaskViewModel(modelContextManager: modelContextManager))
    }

    var body: some View {
        VStack {
            switch taskVM.viewState {
            case .loading:
                ProgressView()
            case .success:
                SegmentControlView(
                    pickerName: K.TaskList.picker,
                    statuses: K.TaskList.statueses,
                    selectedIndex: $taskVM.selectedSegment
                )

                if taskVM.filteredTasks.isEmpty {
                    EmptyStateView(message: "Complete some tasks first")
                } else {
                    TaskListView(
                        tasks: $taskVM.filteredTasks,
                        taskVM: taskVM
                    )
                }
            case .error(let errorMessage):
                ErrorView(errorMessage: errorMessage) {
                    getData()
                }
            }
        }
        .navigationTitle("SoberTask")
        .toolbar {
            Button {
                showAddTaskView.toggle()
            } label: {
                Image(systemName: "plus")
            }
        }
        .onAppear {
            getData()
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView(taskVM: taskVM)
        }
    }

    private func getData() {
        taskVM.fetchData()
    }
}
