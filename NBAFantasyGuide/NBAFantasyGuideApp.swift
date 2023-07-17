//
//  NBAFantasyGuideApp.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import SwiftUI
import CoreData
@main
struct NBAFantasyGuideApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            NBATabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(DataModel())
        }
    }
}
