//
//  SortElementView.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 11.07.2025.
//

import SwiftUICore
import SwiftUI

struct SortElementView: View {
    let filterTitle: String
    let isSelected: Bool
    var onClick: () -> Void
    var body: some View {
        Button(
            action: {
                onClick()
            }
        ) {
            Text(filterTitle)
                .foregroundColor(isSelected ? .white : .blue)
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .background(isSelected ? Color.blue : Color.clear)
                .cornerRadius(16)
        }
                .buttonStyle(PlainButtonStyle())
    }
}
