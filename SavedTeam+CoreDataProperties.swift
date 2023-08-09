//
//  SavedTeam+CoreDataProperties.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 8/8/23.
//
//

import Foundation
import CoreData


extension SavedTeam {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedTeam> {
        return NSFetchRequest<SavedTeam>(entityName: "SavedTeam")
    }

    @NSManaged public var uuids: NSSet?

}

// MARK: Generated accessors for uuids
extension SavedTeam {

    @objc(addUuidsObject:)
    @NSManaged public func addToUuids(_ value: MyPlayers)

    @objc(removeUuidsObject:)
    @NSManaged public func removeFromUuids(_ value: MyPlayers)

    @objc(addUuids:)
    @NSManaged public func addToUuids(_ values: NSSet)

    @objc(removeUuids:)
    @NSManaged public func removeFromUuids(_ values: NSSet)

}

extension SavedTeam : Identifiable {

}
