//
//  Task+CoreDataProperties.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var createDate: Date?
    @NSManaged public var modifyDate: Date?
    @NSManaged public var isCompleted: Bool

}

extension Task : Identifiable {

}
