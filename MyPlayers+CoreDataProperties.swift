//
//  MyPlayers+CoreDataProperties.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/20/23.
//
//

import Foundation
import CoreData


extension MyPlayers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyPlayers> {
        return NSFetchRequest<MyPlayers>(entityName: "MyPlayers")
    }

    @NSManaged public var id: UUID?

}

extension MyPlayers : Identifiable {

}
