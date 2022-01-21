//
//  DataController.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/19/22.
//

import Foundation
import CoreData
import Combine

class DataController: ObservableObject {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Dance-Caller-Cards")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            container.viewContext.automaticallyMergesChangesFromParent = true
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            container.viewContext.undoManager = nil
            container.viewContext.shouldDeleteInaccessibleFaults = true
        })
        return container
    }()
    
    init() {
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        batchInsertFixtures(className: Choreographer.self, filename: "choreographers.json")
        batchInsertFixtures(className: Tag.self, filename: "tags.json")
        batchInsertFixtures(className: Dance.self, filename: "dances.json")
    }
    
    func readJson(filename: String) -> [String: Any] {
        // Get url for file
        guard let fileUrl = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("File could not be located at the given url")
            return Dictionary()
        }
        do {
            // Get data from file
            let data = try Data(contentsOf: fileUrl)
            // Decode data to a Dictionary<String, Any> object
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                print("Could not cast JSON content as a Dictionary<String, Any>")
                return Dictionary()
            }
            // Print result
            print(dictionary)
            return dictionary
        } catch {
            // Print error if something went wrong
            print("Error: \(error)")
            return Dictionary()
        }
    }
    
    func batchInsertFixtures(className: AnyClass, filename: String) {
        let objectsToInsert: [[String : Any]] = [readJson(filename: filename)]
            
        self.persistentContainer.viewContext.performAndWait {
            do {
                let insertRequest = NSBatchInsertRequest(entity: className.entity(), objects: objectsToInsert)
                let insertResult = try self.persistentContainer.viewContext.execute(insertRequest) as! NSBatchInsertResult
                
                let success = insertResult.result as! Bool
                if !success {
                    print("batch insert was not successful")
                }
            } catch {
                print(error.localizedDescription)
            }
            
            if self.persistentContainer.viewContext.hasChanges {
                do {
                    try self.persistentContainer.viewContext.save()
                } catch {
                    print("Error: \(error)\nCould not save Core Data context.")
                    return
                }
            }
        }
    }
}
