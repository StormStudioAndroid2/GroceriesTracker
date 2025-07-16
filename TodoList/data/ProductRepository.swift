//
//  ToDoRepository.swift
//  TodoList
//
//  Created by Sergey Kudinov on 25.05.2025.
//

import Foundation
import RealmSwift

protocol ProductRepository {
    func getToDoList() -> [ProductModelDto]
    func saveToDoList(_ data: [ProductModelDto])
    func clearToDoList()
    func deleteItem(_ groceryItem: ProductModelDto)
}

final class ToDoRepositoryImpl: ProductRepository {
    private let storage: StorageService
    
    init(storage: StorageService = StorageService()) {
        self.storage = storage
    }
    
    func getToDoList() -> [ProductModelDto] {
        let data = storage.fetch(by: ProductModelObject.self)
        return data.map(ProductModelDto.init)
    }
    
    func saveToDoList(_ data: [ProductModelDto]) {
        let objects = data.map(ProductModelObject.init)
        try? storage.saveOrUpdateAllObjects(objects: objects)
    }
    
    func clearToDoList() {
        try? storage.deleteAll()
    }
    
    func deleteItem(_ groceryItem: ProductModelDto) {
        try? storage.delete(object: ProductModelObject.init(groceryItem))
    }
}
