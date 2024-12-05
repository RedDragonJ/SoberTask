//
//  CustomTextField.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(10)
            .background(Color(UIColor.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
    }
}
