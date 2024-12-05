//
//  TaskRowView.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: SoberTask
    var taskVM: TaskViewModel

    var body: some View {
        NavigationLink(destination: TaskDetailsView(taskVM: taskVM, task: $task)) {
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)

                if let details = task.details {
                    Text(details)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
            .padding(.vertical, 4)
        }
    }
}
