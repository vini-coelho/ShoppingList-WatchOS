//
//  Item.swift
//  ShoppingList Watch App
//
//  Created by Vinicius Coelho on 08/07/23.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: UUID
    let text: String
}
