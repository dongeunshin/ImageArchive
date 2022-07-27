//
//  ItemEntity.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/26.
//

import Foundation

import CoreData

@objc(ItemEntity)
public class ItemEntity: NSManagedObject {

}

extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int16
    @NSManaged public var category: String?
    @NSManaged public var eDay: Date?

}
