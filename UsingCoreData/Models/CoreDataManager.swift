//
//  CoreDataManager.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit
import CoreData

enum CoreDataError: Error {
    case createError
    case updateError
    case deleteError
}

final class CoreDataManager {
    // MARK: - Type Properties
    static let shared = CoreDataManager()
    
    // MARK: - Properties
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Life Cycle
    private init() {}
    
    // MARK: - Task
    func getTasks() throws -> [Task] {
        do {
            let tasks = try context.fetch(Task.fetchRequest())
            return tasks
        } catch {
            throw CoreDataError.createError
        }
    }
    
    func create(task title: String?) {
        let newTask = Task(context: context)
        do { let id = try getTasks().count
            newTask.id = String(id)
            newTask.title = title
            newTask.createDate = Date()
            newTask.modifyDate = nil
            newTask.isCompleted = false
        } catch {
            print("error")
        }
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
    
    func delete(task: Task) {
        context.delete(task)
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func update(_ task: Task, isCompleted: Bool) {
        task.isCompleted = isCompleted
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    // MARK: - Completion Task
    func getCompletionTasks() -> [Task] {
        do {
            let tasks = try getTasks()
            let completionTasks = tasks.filter { $0.isCompleted == true }
            return completionTasks
        } catch {
            
        }
        return []
    }
}
