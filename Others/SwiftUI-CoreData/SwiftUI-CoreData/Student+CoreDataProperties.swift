//
//  Student+CoreDataProperties.swift
//  SwiftUI-CoreData
//
//  Created by 杨帆 on 2020/8/3.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var sex: String?

}

extension Student : Identifiable {

}
