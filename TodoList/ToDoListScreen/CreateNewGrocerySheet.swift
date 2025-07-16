//
//  CreateNewGrocerySheet.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 19.06.2025.
//
import SwiftUI

struct CreateNewGrocerySheet: View {
    @Binding var newItemTitle: String
    @Binding var newItemDate: Date
    var onClick: () -> Void
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                VStack {
                    TextField(String(localized: "groceries_sheet_new_item_title"), text: $newItemTitle).font(.largeTitle)
                        .padding(.top)
                    DatePicker(String(localized: "groceries_sheet_new_item_expired_date:"), selection: $newItemDate, displayedComponents: [.date])
                        .padding(.vertical)
                    VStack(alignment: .leading) {
                        Button(
                            action: {
                                onClick()
                            },
                            label: {
                               Spacer()
                                Text(String(localized: "groceries_sheet_create_new_item"))
                                Spacer()
                            },
                        
                        ).padding(7)
                            .background(.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    Spacer()
                }.background(.white)
                    .padding(.all, 20)
                
            }
        }
            .presentationCornerRadius(20)
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(200)])
    }
}
