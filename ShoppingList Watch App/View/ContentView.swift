//
//  ContentView.swift
//  ShoppingList Watch App
//
//  Created by Vinicius Coelho on 08/07/23.
//

import SwiftUI

struct ContentView: View {
  @State private var text: String = ""
  @StateObject private var viewModel = ViewModel()
  
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 6) {
        TextField("Adicionar novo item",  text: $text)
        Button {
          viewModel.add(text: text)
          
        } label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 28))
        }
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
      }
      Spacer()
      
      if viewModel.items.count >= 1 {
        List{
          ForEach(viewModel.items) { item in
            HStack{
              Capsule()
                .frame(width: 4)
                .foregroundColor(.accentColor)
              Text(item.text)
                .lineLimit(1)
                .padding(.leading, 5)
            }
          }
          .onDelete { indexSet in
            withAnimation {
              viewModel.remove(indexSet: indexSet)
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
      viewModel.load()
    })
  }
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
  
}
