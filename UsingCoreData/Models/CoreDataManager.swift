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
    private let entityName = "Task"
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    // MARK: - Life Cycle
    private init() {}
    
    // MARK: - Task
    func getTasks() -> [Task] {
        var tasks: [Task] = []
        guard let context = self.context else { return tasks }
        let request = NSFetchRequest<NSManagedObject>(entityName: self.entityName)
        if let fetchedTasks = try! context.fetch(request) as? [Task] {
            tasks = fetchedTasks
        }
        return tasks
    }
    
    func create(task title: String) {
        guard let context = self.context,
              let entity = NSEntityDescription.entity(forEntityName: self.entityName, in: context) else { return }
        if let task = NSManagedObject(entity: entity, insertInto: context) as? Task {
            task.id = String(getTasks().count)
            task.title = title
            task.createDate = Date()
            task.modifyDate = nil
            task.isCompleted = false
            appDelegate?.saveContext()
        }
    }
    
    func update(_ task: Task) {
        guard let id = task.id else { return }
        let request = NSFetchRequest<NSManagedObject>(entityName: self.entityName)
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        let tasks = getTasks()
        var oldTask = tasks.first
        oldTask = task
        appDelegate?.saveContext()
    }
    
    // MARK: - Completion Task
    func getCompletionTasks() -> [Task] {
        let tasks = getTasks()
        let completionTasks = tasks.filter { $0.isCompleted == true }
        return completionTasks
    }
}
