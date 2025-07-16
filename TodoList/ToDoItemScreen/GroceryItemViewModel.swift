//
//  GroceryItemViewModel.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 05.06.2025.
//

import Foundation
@MainActor
class GroceryItemViewModel: ObservableObject {
    @Published var activity: Grocery
   
    init(activity: Grocery) {
        self.activity = activity
    }
}
