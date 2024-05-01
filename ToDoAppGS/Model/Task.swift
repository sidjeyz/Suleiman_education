//
//  Task.swift
//  ToDoAppGS
//
//  Created by guseyn on 05.02.2024.
//

import Foundation


struct Task: Codable{
    var title: String?
    var isDone: Bool?
    var creationDate: Date?
    var date: Date?
    var time: Date?
    var comm: String?
}
