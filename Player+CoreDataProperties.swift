//
//  Player+CoreDataProperties.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/25/23.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var age: Int
    @NSManaged public var ast: Double
    @NSManaged public var blk: Double
    @NSManaged public var drb: Double
    @NSManaged public var efgp: Double
    @NSManaged public var fg: Double
    @NSManaged public var fga: Double
    @NSManaged public var fgp: Double
    @NSManaged public var ft: Double
    @NSManaged public var fta: Double
    @NSManaged public var ftp: Double
    @NSManaged public var g: Int
    @NSManaged public var gs: Int
    @NSManaged public var id: UUID?
    @NSManaged public var mp: Double
    @NSManaged public var name: String
    @NSManaged public var orb: Double
    @NSManaged public var pf: Double
    @NSManaged public var pos: String
    @NSManaged public var pts: Double
    @NSManaged public var rk: Int
    @NSManaged public var stl: Double
    @NSManaged public var team: String
    @NSManaged public var thp: Double
    @NSManaged public var thpa: Double
    @NSManaged public var thpp: Double
    @NSManaged public var tov: Double
    @NSManaged public var trb: Double
    @NSManaged public var twp: Double
    @NSManaged public var twpa: Double
    @NSManaged public var twpp: Double
    @NSManaged public var isRookie: Bool
    @NSManaged public var college: String?

}

extension Player : Identifiable {

}
