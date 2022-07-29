//
//  DataManager.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/26.
//

import Foundation

import CoreData

class DataManager {
    
   static let shared = DataManager()
   private init() { }
   var container: NSPersistentContainer?
   var mainContext: NSManagedObjectContext {
    guard let context = container?.viewContext else{
      fatalError("Not Implemented")
    }
    return context
   }

    func setup(modelName: String){
        container = NSPersistentContainer(name: modelName)
        container?.loadPersistentStores(completionHandler: {(desc, error) in
            if let error = error{
                fatalError(error.localizedDescription)
            }
        })
    }
    func saveMainContext() {
        mainContext.perform {
            if self.mainContext.hasChanges{
                do{
                    try self.mainContext.save()
                }catch{
                    print(error)
                }
            }
        }
   }
}

extension DataManager {
    func createItem(name: String, path: String, url: String, message: String , completion: (() -> ())? = nil){
        mainContext.perform{
            let newItem = ItemEntity(context: self.mainContext)
            newItem.name = name
            newItem.path = path
            newItem.url = url
            newItem.message = message
            self.saveMainContext()
            completion?()
        }
    }
    
    func delete(entity: ItemEntity){
        mainContext.perform {
            self.mainContext.delete(entity)
            self.saveMainContext()
        }
    }
}
