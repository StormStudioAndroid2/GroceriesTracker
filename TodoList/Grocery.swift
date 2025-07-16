//
//  Grocery.swift
//  TodoList
//
//  Created by Sergey Kudinov on 14.05.2025.
//

import Foundation

struct Grocery: Identifiable, Equatable, Hashable {
    var id = UUID()
    let title: String
    var isOpened: Bool
    let expirationDate: Date
    let creationDate: Date
    let isLiked: Bool
    
    init(title: String, isCompleted: Bool = false, isLiked: Bool = false, date: Date = Date()) {
        self.title = title
        self.isOpened = isCompleted
        self.expirationDate = date
        self.creationDate = Date.now
        self.isLiked = isLiked
    }
}
