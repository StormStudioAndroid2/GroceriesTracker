//
//  GroceriesListItemView.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 15.07.2025.
//

import SwiftUICore
import XCUIAutomation
import SwiftUI


struct GroceriesListItemView: View {
    var grocery: Grocery
    var onOpenItem: (Grocery) -> Void
    var setChecked: (Grocery) -> Void
    var onRemoveItem: (Grocery) -> Void
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(grocery.title)
                Text("Expired at: " + DateFormatter.viewDateFormatter.string(from: grocery.expirationDate))
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Created at: " + DateFormatter.viewDateFormatter.string(from: grocery.creationDate))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: grocery.isOpened ? "lock.open.fill" : "lock.fill")
                .onTapGesture {
                    setChecked(grocery)
                }
        }
        .onTapGesture {
            onOpenItem(grocery)
        }
        .swipeActions {
            Button {
                onRemoveItem(grocery)
            } label: {
                Text(String(localized: "grocery_item_delete_action"))
            }.background(Color.yellow)
        }
    }
}
