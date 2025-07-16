//
//  DateFormatter.swift
//  GroceriesListView
//
//  Created by Sergey Kudinov on 17.06.2025.
//
import Foundation

extension DateFormatter {
    static let viewDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
}
