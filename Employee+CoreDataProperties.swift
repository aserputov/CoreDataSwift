//
//  Employee+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Anatoliy Serputov on 2021-12-05.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateHired: String?

}

extension Employee : Identifiable {

}
