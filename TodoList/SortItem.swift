import Foundation

struct SortItem: Equatable, Hashable {
    let title: String
    var isSelected: Bool
    var sortMode: SortMode
}
