//
//  FileManager-DocumentsDirectory.swift
//  ShoppingList Watch App
//
//  Created by Vinicius Coelho on 08/07/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
