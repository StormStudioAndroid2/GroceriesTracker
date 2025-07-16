import Foundation

@MainActor
class GroceriesListViewModel: ObservableObject {
    
    @Published var groceriesList: [Grocery] = []
    @Published var showingNewGrocerySheet = false
    @Published var newItemTitle = ""
    @Published var newItemDate = Date()
    @Published var sortItemList: [SortItem] = [
        SortItem(title: String(localized: "groceries_list_sort_title"), isSelected: false, sortMode: .title),
        SortItem(title: String(localized:"groceries_list_sort_expired_date"), isSelected: false, sortMode: .expirationDate),
        SortItem(title: String(localized: "groceries_list_sort_created_date"), isSelected: false, sortMode: .creationDate)
    ]
    
    @Published var sortMode : SortMode = .none
    
    var toDoListRepository: ProductRepository
    
    init(toDoListRepository: ProductRepository = ToDoRepositoryImpl()) {
        self.toDoListRepository = toDoListRepository
        groceriesList = self.toDoListRepository.getToDoList().map(Grocery.init)
    }
    
    func sortByCreationDate() {
        groceriesList = groceriesList.sorted {
            $0.creationDate < $1.creationDate
        }
    }
    
    private func sortByExpirationDateDate() {
        groceriesList = groceriesList.sorted {
            $0.expirationDate < $1.expirationDate
        }
    }
    
    private func sortByTitle() {
        groceriesList = groceriesList.sorted {
            $0.title < $1.title
        }
    }
    
    private func sortDefault() {
        sortMode = .none
        groceriesList = self.toDoListRepository.getToDoList().map(Grocery.init)
    }
    
    func addNewItem() {
        showingNewGrocerySheet = true
    }
    
    
    func saveNewItem() {
        guard !newItemTitle.isEmpty else { return }
        groceriesList.append(Grocery(title: newItemTitle, date: newItemDate))
        toDoListRepository.saveToDoList(groceriesList.map(ProductModelDto.init))
        newItemTitle = ""
        newItemDate = Date()
        showingNewGrocerySheet = false
    }
    
    func setItemChecked(_ activity: Grocery) {
        if let index = groceriesList.firstIndex(of: activity) {
            groceriesList[index].isOpened.toggle()
            toDoListRepository.saveToDoList(groceriesList.map(ProductModelDto.init))
        }
    }
    
    func deleteItem(_ activity: Grocery) {
        if let index = groceriesList.firstIndex(of: activity) {
            groceriesList.remove(at: index)
            toDoListRepository.deleteItem(ProductModelDto.init(activity: activity))
        }
    }
    
    func setFilter(_ filterItem: SortItem) {
       sortItemList = sortItemList.map { SortItem(
            title: $0.title,
            isSelected: $0 == filterItem && !filterItem.isSelected,
            sortMode: $0.sortMode
        ) }
        selectSortMode(filterItem.sortMode)
    }
    
    func selectSortMode(_ sortMode: SortMode) {
        if (sortMode == self.sortMode) {
            sortDefault()
            return
        }
        switch (sortMode) {
            case .creationDate:
                sortByCreationDate()
            case .expirationDate:
                sortByExpirationDateDate()
            case .title:
                sortByTitle()
            default:
                sortDefault()
        }
        self.sortMode = sortMode 
    }

}
