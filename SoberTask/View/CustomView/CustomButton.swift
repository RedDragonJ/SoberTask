//
//  CustomButton.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(maxWidth: .infinity, minHeight: 44)
        }
        .buttonStyle(.borderedProminent)
        .padding([.horizontal, .bottom], 16)
    }
}
