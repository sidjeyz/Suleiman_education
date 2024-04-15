//
//  Category.swift
//  ToDoAppGS
//
//  Created by guseyn on 05.02.2024.
//

import Foundation


struct Category {
    let id: Int
    let title: String
    let imageURL: String
    let icon: String
    
    static let all = Category(id: 0, title: "Все", imageURL: "", icon: "")
    static let today = Category(id: 1, title: "Сегодня", imageURL: "", icon: "")
}
