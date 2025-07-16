//
//  GroceriesListView.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 11.05.2025.
//

import SwiftUI

struct GroceriesListView: View {
    @StateObject private var viewModel = GroceriesListViewModel()
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 0) {
            Toolbar(title: String(localized: "groceries_list_title"))
            VStack {
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        SortElementIconView()
                        ForEach(viewModel.sortItemList, id: \.title) { filter in
                            SortElementView(
                                filterTitle: filter.title,
                                isSelected: filter.isSelected,
                                onClick: {
                                    viewModel.setFilter(filter)
                                }
                            )
                        }
                    }
                }
                ZStack {
                    List {
                        if (!viewModel.groceriesList.filter { $0.isOpened == false}.isEmpty) {
                            Section{
                                ForEach(viewModel.groceriesList.filter { $0.isOpened == false }) {
                                    activity in
                                    GroceriesListItemView(
                                        grocery: activity,
                                        onOpenItem: { product in
                                            router.push(.goToToDoItem(activity: product)) },
                                        setChecked: {  product in
                                        viewModel.setItemChecked(product)
                                    },
                                        onRemoveItem: { product in
                                            viewModel.deleteItem(product)
                                        }
                                    )
                                }
                            } header: {
                                Text(String(localized: "groceries_list_closed_title"))
                            }
                        }
                        if (!viewModel.groceriesList.filter { $0.isOpened == true }.isEmpty) {
                            Section {
                                ForEach(viewModel.groceriesList.filter {$0.isOpened == true }) { activity in
                                    GroceriesListItemView(
                                        grocery: activity,
                                        onOpenItem: { product in
                                            router.push(.goToToDoItem(activity: product)) },
                                        setChecked: {  product in
                                        viewModel.setItemChecked(product)
                                    },
                                        onRemoveItem: { product in
                                            viewModel.deleteItem(product)
                                        }
                                    )
                                }
                            } header: {
                                Text(String(localized:"groceries_list_opened_title"))
                            }
                        }
                    }
                    Spacer()
                }
                Button(action: {
                    viewModel.addNewItem()
                }) {
                    Text(String(localized: "groceries_add_new_item_button_title"))
                }
            }
            .padding()
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $viewModel.showingNewGrocerySheet) {
                CreateNewGrocerySheet(newItemTitle: $viewModel.newItemTitle, newItemDate: $viewModel.newItemDate) {
                    viewModel.saveNewItem()
                }
            }
        }
    }
}

#Preview {
    GroceriesListView()
}
