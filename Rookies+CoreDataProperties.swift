//
//  Rookies+CoreDataProperties.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/24/23.
//
//

import Foundation
import CoreData


extension Rookies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rookies> {
        return NSFetchRequest<Rookies>(entityName: "Rookies")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var tm: String?
    @NSManaged public var pk: Int64

}

extension Rookies : Identifiable {

}
