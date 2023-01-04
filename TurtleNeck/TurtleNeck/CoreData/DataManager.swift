//
//  DataManager.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/04.
//

import Foundation
import CoreData

struct DataManager {
    static let shared = DataManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "User")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unsolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
