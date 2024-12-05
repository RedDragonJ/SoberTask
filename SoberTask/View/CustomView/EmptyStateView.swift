//
//  EmptyStateView.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Image(systemName: "tray")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
                Text(message)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.bottom, 16)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }
}
