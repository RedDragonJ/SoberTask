//
//  TaskListView.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct TaskListView: View {
    @Binding var tasks: [SoberTask]
    var taskVM: TaskViewModel

    var body: some View {
        List {
            ForEach($tasks) { $task in
                TaskRowView(task: $task, taskVM: taskVM)
            }
            .onDelete { offsets in
                offsets.forEach { index in
                    taskVM.deleteTask(task: tasks[index])
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
