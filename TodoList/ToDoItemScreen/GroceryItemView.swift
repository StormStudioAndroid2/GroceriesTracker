//
//  GroceryItemView.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 05.06.2025.
//

import SwiftUICore
import RealmSwift
import SwiftUI

struct GroceryItemView: View {
    @StateObject private var viewModel: GroceryItemViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(activity: Grocery) {
        _viewModel = StateObject(wrappedValue: GroceryItemViewModel(activity: activity))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Toolbar(title: "Product details")
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    // Title Section
                    VStack(alignment: .leading) {
                        Text("Title")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(viewModel.activity.title)
                            .font(.title2)
                    }
                    
                    // Status Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Status")
                            .font(.headline)
                            .foregroundColor(.gray)
                        HStack {
                            Image(systemName: viewModel.activity.isOpened ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(viewModel.activity.isOpened ? .green : .gray)
                            Text(viewModel.activity.isOpened ? "Opened" : "Closed")
                                .foregroundColor(viewModel.activity.isOpened ? .green : .gray)
                        }
                    }
                    
                    // Date Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(DateFormatter.viewDateFormatter.string(from: viewModel.activity.expirationDate))
                            .font(.body)
                    }
                }.padding(.horizontal, 40)
                
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    GroceryItemView(activity: Grocery(title: "Preview Activity"))
}
