//
//  ContentView.swift
//  ShoppingList Watch App
//
//  Created by Vinicius Coelho on 08/07/23.
//

import SwiftUI

struct ContentView: View {
  @State private var items: [Item] = [Item]()
  @State private var text: String = ""
  @StateObject private var itemViewModel = ItemViewModel()
  
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 6) {
        TextField("Adicionar novo item",  text: $text)
        Button {
          itemViewModel.saveItems(text: text)
          
        } label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 28))
        }
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
      }
      Spacer()
      
      if itemViewModel.items.count >= 1 {
        List{
          ForEach(itemViewModel.items) { item in
            HStack{
              Capsule()
                .frame(width: 4)
                .foregroundColor(.accentColor)
              Text(item.text)
                .lineLimit(1)
                .padding(.leading, 5)
            }
          }
        }
      } else {
        Spacer()
        Image(systemName: "note.text")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray)
          .opacity(0.25)
          .padding(25)
        Spacer()
      }
      
    }
    .navigationTitle("Compras")
    .onAppear(perform: {
      itemViewModel.loadItems()
    })
  }
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
  
}
