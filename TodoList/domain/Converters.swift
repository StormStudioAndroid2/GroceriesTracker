//
//  Converters.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 25.05.2025.
//
import Foundation

extension ProductModelObject {
    convenience init(_ dto: ProductModelDto) {
        self.init()
        id = dto.id
        text = dto.text
        isFinished = dto.isFinished
        expirationDate = dto.expirationDate
        creationDate = dto.creationDate
        isLiked = dto.isLiked
    }
}

extension ProductModelDto {
    init(object: ProductModelObject) {
        id = object.id
        text = object.text
        isFinished = object.isFinished
        expirationDate = object.expirationDate
        creationDate = object.creationDate
        isLiked = object.isLiked
    }
    
    init(activity: Grocery) {
        id = activity.id
        text = activity.title
        isFinished = activity.isOpened
        expirationDate = activity.expirationDate
        creationDate = activity.creationDate
        isLiked = activity.isLiked
    }
}

extension Grocery {
    init(object: ProductModelDto) {
        id = object.id
        title = object.text
        isOpened = object.isFinished
        expirationDate = object.expirationDate
        creationDate = object.creationDate
        isLiked = object.isLiked
    }
}
