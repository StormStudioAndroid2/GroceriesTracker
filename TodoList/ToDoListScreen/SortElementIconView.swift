//
//  SortElementIconView.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 11.07.2025.
//

import SwiftUICore
import SwiftUI

struct SortElementIconView: View {
    
    var body: some View {
        Image(
            systemName: "arrow.up.arrow.down"
        ).foregroundColor(.blue)
            .padding(.trailing, 12)
            .padding(.vertical, 8)
    }
}
