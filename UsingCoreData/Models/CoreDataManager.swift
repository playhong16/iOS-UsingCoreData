//
//  CoreDataManager.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit
import CoreData

final class CoreDataManager {
    // MARK: - Type Properties
    static let shared = CoreDataManager()
    
    // MARK: - Properties
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Life Cycle
    private init() {}
    
    // MARK: - Task
    func getTasks() -> [Task] {
        do {
            let tasks = try context.fetch(Task.fetchRequest())
            return tasks
        } catch {
            // error
        }
        return []
    }
    
    func create(task title: String?) {
        let newTask = Task(context: context)
        let id = getTasks().count
        newTask.id = String(id)
        newTask.title = title
        newTask.createDate = Date()
        newTask.modifyDate = nil
        newTask.isCompleted = false
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func delete(task: Task) {
        context.delete(task)
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func update(_ task: Task, updateTitle: String?) {
        task.title = updateTitle
        task.modifyDate = Date()
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    // MARK: - Completion Task
    func getCompletionTasks() -> [Task] {
        let tasks = getTasks()
        let completionTasks = tasks.filter { $0.isCompleted == true }
        return completionTasks
    }
}
