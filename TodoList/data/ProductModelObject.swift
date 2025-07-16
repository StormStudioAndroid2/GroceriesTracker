//
//  ToDoModelCrud.swift
//  TodoList
//
//  Created by Sergey Kudinov on 25.05.2025.
//

import RealmSwift
import Foundation

class ProductModelObject : Object {
    
    @Persisted(primaryKey: true) var id: UUID = UUID()
    @Persisted var text = ""
    @Persisted var isFinished = false
    @Persisted var expirationDate = Date()
    @Persisted var creationDate = Date()
    @Persisted var isLiked: Bool

    convenience init(
        id: String,
        text: String,
        isFinished: Bool,
        expirationDate: Date,
        isLiked: Bool
    ) {
        
        self.init()
        self.text = text
        self.isFinished = isFinished
        self.expirationDate = expirationDate
        self.isLiked = isLiked
    }
}
