//
//  ItemViewModel.swift
//  ShoppingList Watch App
//
//  Created by Vinicius Coelho on 08/07/23.
//

import Foundation

extension ContentView {
  @MainActor class ViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    func save() {
      do {
        let data = try JSONEncoder().encode(self.items)
        let url = FileManager.documentsDirectory.appendingPathComponent("shopping-list-items")
        try data.write(to: url)
      } catch {
        print("Error saving item")
      }
    }
    
    func load() {
      DispatchQueue.main.async {
        do {
          let url = FileManager.documentsDirectory.appendingPathComponent("shopping-list-items")
          let data = try Data(contentsOf: url)
          let items = try JSONDecoder().decode([Item].self, from: data)
          self.items = items
        } catch {
          
        }
      }
    }
    
    func add(text: String) {
      guard text.isEmpty == false else { return }
      let item = Item(id: UUID(), text: text)
      self.items.append(item)
      self.save()
    }
    
    func remove(indexSet: IndexSet) {
      self.items.remove(atOffsets: indexSet)
      self.save()
    }
  }
}
