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
    
    func create() {
        guard let context = self.context,
              let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return }
        if let task = NSManagedObject(entity: entity, insertInto: context) as? Task {
            task.id = "0"
            task.title = "swift 공부하기"
            task.createDate = Date()
            task.isCompleted = false
            appDelegate?.saveContext()
        }
    }

}
