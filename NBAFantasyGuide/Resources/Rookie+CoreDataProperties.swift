//
//  Rookie+CoreDataProperties.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/24/23.
//
//

import Foundation
import CoreData


extension Rookie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rookie> {
        return NSFetchRequest<Rookie>(entityName: "Rookie")
    }

    @NSManaged public var nm: String?
    @NSManaged public var idNum: UUID?
    @NSManaged public var tm: String?
    @NSManaged public var pk: Int64

}

extension Rookie : Identifiable {

}
