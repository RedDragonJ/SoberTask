//
//  AddTaskView.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct AddTaskView: View {
    var taskVM: TaskViewModel

    @Environment(\.dismiss) private var dismiss
    @State private var inputTitle: String = ""
    @State private var inputDetail: String = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("New Task")
                .font(.headline)
                .padding(.top, 16)

            Form {
                Section(header: Text("Task Title")) {
                    CustomTextField(placeholder: K.AddTask.titlePlaceholder, text: $inputTitle)
                }

                Section(header: Text("Task Details (optional)")) {
                    CustomTextField(placeholder: K.AddTask.detailPlaceholder, text: $inputDetail)
                }
            }
            .formStyle(.grouped)
            .scrollContentBackground(.hidden)

            CustomButton(text: "Create Task") {
                guard !inputTitle.isEmpty else { return } // Should Show alert
                taskVM.addTask(title: inputTitle, details: inputDetail)
                dismiss()
            }
        }
        .presentationDetents([.medium])
        .presentationDragIndicator(.hidden)
    }
}
