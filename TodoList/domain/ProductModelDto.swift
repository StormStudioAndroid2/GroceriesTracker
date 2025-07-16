//
//  ToDoModelDto.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 25.05.2025.
//

import Foundation

struct ProductModelDto {
    let id: UUID
    let text: String
    let isFinished: Bool
    let expirationDate: Date
    let creationDate: Date
    let isLiked: Bool
}
