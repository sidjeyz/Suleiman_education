//
//  TasksService.swift
//  ToDoAppGS
//
//  Created by Сулейман on 09.04.2024.
//

import Foundation

protocol TaskService{
    
    func getCategories() -> [Any]
    func save(task: Task) throws
    func listTasks() -> [Task]
    
}

class TaskServiesImpl: TaskService{
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    static let shared = TaskServiesImpl()
    
    func getCategories() -> [Any] {
        return[]
    }
    
    func save(task: Task) throws {
        let ud = UserDefaults.standard
        print(ud.object(forKey: Constants.tasksKey))
        if let currentData = ud.object(forKey: Constants.tasksKey) as? Data{
            var tasks = try decoder.decode([Task].self, from: currentData)
            tasks.append(task)
            let updatedTasksData = try encoder.encode(tasks)
            ud.set(updatedTasksData, forKey: Constants.tasksKey)
        } else {
            let tasks = [task]
            let data = try encoder.encode(tasks)
            ud.set(data, forKey: Constants.tasksKey)
        }
    }
    
    func listTasks() -> [Task] {
        let ud = UserDefaults.standard
        var tasks = [Task]()
        if let currentData = ud.object(forKey: Constants.tasksKey), let task = try? decoder.decode([Task].self, from: currentData as! Data) {
            tasks = task
        }

        return tasks
    
    }
}
