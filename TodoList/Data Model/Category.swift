//
//  Category.swift
//  TodoList
//
//  Created by Илья Лясин
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
