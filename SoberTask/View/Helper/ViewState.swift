//
//  ViewState.swift
//  SoberTask
//
//  Created by James Layton on 12/5/24.
//

import Foundation

enum ViewState: Equatable {
    case loading
    case success
    case error(String)
}
