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
    
    func createItem(name: String, quantity: Int? = nil, eDay: Date,category: Int, photo: Data, alertbefore: Int, alerttime: Date, completion: (() -> ())? = nil){
//        mainContext.perform{
//            var newItem = ItemEntity(context: self.mainContext)
//            newItem.name = name
//            if let quantity = quantity{
//                newItem.quantity = Int16(quantity)
//            }
//            newItem.eDay = eDay
//            newItem.photo = photo
//            newItem.category = Int16(category)
//            newItem.alerttime = alerttime
//            newItem.alertbefore = Int16(alertbefore)
//            self.saveMainContext()
//            completion?()
//        }
    }
    
    func fatchItem(predicate: NSPredicate? = nil) -> [ItemEntity]{
        var list = [ItemEntity]()
        
        mainContext.performAndWait {
            let request: NSFetchRequest<ItemEntity> = ItemEntity.fetchRequest()
            request.predicate = predicate
            let sortBydate = NSSortDescriptor(key: #keyPath(ItemEntity.eDay), ascending: true)
            let sortByname = NSSortDescriptor(key: #keyPath(ItemEntity.name), ascending: false)
            request.sortDescriptors = [sortBydate,sortByname]
            do{
                list = try mainContext.fetch(request)
            }catch{
                print(error)
            }
        }
        return list
    }
    
    func updateItem(entity: ItemEntity, name: String,quantity: Int? = nil,eDay: Date, category: Int, photo: Data, alertbefore: Int, alerttime: Date, completion: (() -> ())? = nil){
//        mainContext.perform {
//            entity.name = name
//            if let quantity = quantity{
//                entity.quantity = Int16(quantity)
//            }
//            entity.eDay = eDay
//            entity.photo = photo
//            entity.category = Int16(category)
//            entity.alertbefore = Int16(alertbefore)
//            entity.alerttime = alerttime
//            self.saveMainContext()
//            completion?()
//        }
    }
    
    func delete(entity: ItemEntity){
        mainContext.perform {
            self.mainContext.delete(entity)
            self.saveMainContext()
        }
    }
}
