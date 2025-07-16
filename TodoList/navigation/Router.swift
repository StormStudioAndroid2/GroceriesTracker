//
//  Router.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 01.06.2025.
//


import SwiftUI


@MainActor
final class Router: ObservableObject {
    
    enum Route: Hashable {
        case goToToDoList
        case goToToDoItem(activity: Grocery)
    }
    
  // MARK: - Public properties
  
  @Published var path = NavigationPath()
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .goToToDoList:
            GroceriesListView()
        case .goToToDoItem(let activity):
            GroceryItemView(activity: activity)
        }
    }
        
        @inlinable
        @inline(__always)
        func push(_ appRoute: Route) {
            path.append(appRoute)
        }
        
        @inlinable
        @inline(__always)
        func pop() {
            guard !path.isEmpty else {
                return
            }
            path.removeLast()
            if (path.isEmpty) {
                exit(0)
            }
        }
        
        @inlinable
        @inline(__always)
        func popToRoot() {
            path.removeLast(path.count)
        }
}
