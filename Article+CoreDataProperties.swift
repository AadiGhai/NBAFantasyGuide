//
//  Article+CoreDataProperties.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/25/23.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var articleName: String
    @NSManaged public var articleURL: String

}

extension Article : Identifiable {

}
