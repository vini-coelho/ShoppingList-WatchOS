//
//  ItemViewModel.swift
//  ShoppingList Watch App
//
//  Created by Vinicius Coelho on 08/07/23.
//

import Foundation

extension ContentView {
    @MainActor class ItemViewModel: ObservableObject {
        @Published var items: [Item] = []
        
        func saveItems(text: String) {
            do {
                guard text.isEmpty == false else { return }
                let item = Item(id: UUID(), text: text)
                items.append(item)
                let data = try JSONEncoder().encode(items)
                let url = FileManager.documentsDirectory.appendingPathComponent("shopping-list-items")
                try data.write(to: url)
            } catch {
                print("Error saving item")
            }
        }
        
        func loadItems() {
            DispatchQueue.main.async {
                do {
                    let url = FileManager.documentsDirectory.appendingPathComponent("shopping-list-items")
                    let data = try Data(contentsOf: url)
                    let items = try JSONDecoder().decode([Item].self, from: data)
                    self.items = items
                    print(items)
                } catch {
    
                }
            }
        }
    }
}
