//
//  RouterView.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 01.06.2025.
//

import SwiftUICore
import SwiftUI

struct RouterView<Content: View>: View {
    @inlinable
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) {
                    router.view(for: $0)
                }
                .toolbar(.hidden, for: .navigationBar)
        }
        .toolbar(.hidden, for: .navigationBar)
        .environmentObject(router)
        .task {
            router.push(.goToToDoList)
        }
    }

    @StateObject private var router = Router()
    private let content: Content
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
