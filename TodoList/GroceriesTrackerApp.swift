//
//  TodoListApp.swift
//  TodoList
//
//  Created by Sergey Kudinov on 11.05.2025.
//

import SwiftUI

@main
struct GroceriesTrackerApp: App {
    @StateObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
