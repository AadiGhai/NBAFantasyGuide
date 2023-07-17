//
//  DataService.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import Foundation
import CoreData
class DataService{
    static func getLocalData()->[PlayerJSON]{

        //Parse local json file
        
        //get url path to json file
        let pathString = Bundle.main.path(forResource: "playerdata", ofType: "json")
        
        //check if pathstring is not will, otherwise...
        guard pathString != nil else{
            return [PlayerJSON]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            //create data object
            
            let data = try Data(contentsOf: url)
            
            //decode data with JSON decoder
            let decoder = JSONDecoder()
            
            do{
                var playerData = try decoder.decode([PlayerJSON].self, from: data)
                for index in 0..<playerData.count {
                    playerData[index].id = UUID()
                }
                return playerData
            }
            catch{
                print(error)
            }
            //add unique ids
            
            //return recipes
        }
        catch{
            print(error)
        }
        return [PlayerJSON]()
        
    }
    /*static func getLocalData() -> [PlayerJSON] {
        var playerData = [PlayerJSON]()
        let context = PersistenceController.shared.container.viewContext

        do {
            let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
            let players = try context.fetch(fetchRequest)

            // Convert fetched Player entities to PlayerJSON objects
            playerData = players.map { player in
                return PlayerJSON(id: player.id,
                                  rk: player.rk,
                                  name: player.name,
                                  pos: player.pos,
                                  age: player.age,
                                  team: player.team ,
                                  g: player.g,
                                  gs: player.gs,
                                  mp: player.mp,
                                  fg: player.fg,
                                  fga: player.fga,
                                  fgp: player.fgp,
                                  thp: player.thp,
                                  thpa: player.thpa,
                                  thpp: player.thpp,
                                  twp: player.twp,
                                  twpa: player.twpa,
                                  twpp: player.twpp,
                                  efgp: player.efgp,
                                  ft: player.ft,
                                  fta: player.fta,
                                  ftp: player.ftp,
                                  orb: player.orb,
                                  drb: player.drb,
                                  trb: player.trb,
                                  ast: player.ast,
                                  stl: player.stl,
                                  blk: player.blk,
                                  tov: player.blk,
                                  pf: player.pf,
                                  pts: player.pts
                )
            }
        } catch {
            print("Failed to fetch player data from Core Data: \(error)")
        }

        return playerData
    } */
    
}
