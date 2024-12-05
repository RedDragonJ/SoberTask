//
//  SegmentControlView.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import SwiftUI

struct SegmentControlView: View {
    let pickerName: String
    let statuses: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        Picker(pickerName, selection: $selectedIndex) {
            ForEach(0..<statuses.count, id: \.self) { index in
                Text(statuses[index]).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
