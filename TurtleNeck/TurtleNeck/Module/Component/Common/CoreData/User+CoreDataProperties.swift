//
//  User+CoreDataProperties.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/03.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var image: Data?
    @NSManaged public var score: Int32
    @NSManaged public var degree: Double
    @NSManaged public var date: Date?
    @NSManaged public var validity: Double

}

extension User : Identifiable {

}
