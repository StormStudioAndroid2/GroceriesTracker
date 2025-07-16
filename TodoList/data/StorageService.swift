//
//  StorageService.swift
//  TodoList
//
//  Created by Sergey Kudinov on 25.05.2025.
//


import Foundation
import RealmSwift

final class StorageService {
    private let storage: Realm?
    
    init(
        _ configuration: Realm.Configuration = Realm.Configuration(
            schemaVersion: 3,
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion == 1 {
                        migration.enumerateObjects(ofType: ProductModelObject.className()) { oldObject, newObject in
                            newObject?["creationDate"] = Date()
                            newObject?["expirationDate"] = Date()

                        }
                    }
                    
                    if oldSchemaVersion == 2 {
                        migration.enumerateObjects(ofType: ProductModelObject.className()) { oldObject, newObject in
                        newObject?["creationDate"] = Date()
                        newObject?["expirationDate"] = oldObject?["date"] ??  Date()
                    }
                }
            }
        )
    ) {
        self.storage = try? Realm(configuration: configuration)
    }
    
    func saveOrUpdateObject(object: Object) throws {
        guard let storage else { return }
        storage.writeAsync {
            storage.add(object, update: .all)
        }
    }
    
    func saveOrUpdateAllObjects(objects: [Object]) throws {
        try objects.forEach {
            try saveOrUpdateObject(object: $0)
        }
    }
    
    func delete(object: ProductModelObject) throws {
        guard let storage else { return }
        guard let objectToDelete = storage.object(ofType: ProductModelObject.self, forPrimaryKey: object.id) else {
            return
        }
        storage.writeAsync {
            storage.delete(objectToDelete)
        }
    }
    
    func deleteAll() throws {
        guard let storage else { return }
        try storage.write {
            storage.deleteAll()
        }
    }
    
    func fetch<T: Object>(by type: T.Type) -> [T] {
        guard let storage else { return [] }
        return storage.objects(T.self).toArray()
    }
}

extension Results {
    func toArray() -> [Element] {
        .init(self)
    }
}
