//
//  CoreDataManager.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private let entityName = "Task"
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    private init() {}
    
    func create(task title: String) {
        guard let context = self.context,
              let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return }
        if let task = NSManagedObject(entity: entity, insertInto: context) as? Task {
            task.id = String(getTasks().count)
            task.title = title
            task.createDate = Date()
            task.modifyDate = nil
            task.isCompleted = false
            appDelegate?.saveContext()
        }
    }
    
    func getTasks() -> [Task] {
        var tasks: [Task] = []
        guard let context = self.context else { return tasks }
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
        if let fetchedTasks = try! context.fetch(request) as? [Task] {
            tasks = fetchedTasks
            print(fetchedTasks)
        }
        return tasks
    }

}
