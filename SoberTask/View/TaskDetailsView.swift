//
//  TaskDetails.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct TaskDetailsView: View {
    var taskVM: TaskViewModel
    @Binding var task: SoberTask

    @Environment(\.dismiss) private var dismiss
    @State private var inputTitle: String
    @State private var inputDetail: String
    @State private var inputIsComplete: Bool

    init(taskVM: TaskViewModel, task: Binding<SoberTask>) {
        self.taskVM = taskVM
        self._task = task
        self._inputTitle = State(initialValue: task.wrappedValue.title)
        self._inputDetail = State(initialValue: task.wrappedValue.details ?? "")
        self._inputIsComplete = State(initialValue: task.wrappedValue.isCompleted)
    }

    var body: some View {
        Group {
            Form {
                Section(header: Text("Task Title")) {
                    CustomTextField(placeholder: "", text: $inputTitle)
                        .disabled(task.isCompleted)
                }

                Section(header: Text("Task Details (optional)")) {
                    CustomTextField(placeholder: "", text: $inputDetail)
                        .disabled(task.isCompleted)
                }

                Section {
                    Toggle("Task Complete", isOn: $inputIsComplete)
                        .disabled(task.isCompleted)
                }
            }
            .formStyle(.grouped)
            .scrollContentBackground(.hidden)

            if !task.isCompleted {
                CustomButton(text: "Save Changes") {
                    guard !inputTitle.isEmpty else { return } // Should Show alert
                    taskVM.updateTask(task: task, newTitle: inputTitle, newDetails: inputDetail, newIsCompleted: inputIsComplete)
                    dismiss()
                }
            }
        }
        .navigationTitle("Task Detail")
    }
}
