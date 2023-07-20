//
//  DataModelView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import Foundation
import CoreData

class DataModel:ObservableObject{
    let managedObjectContext = PersistenceController.shared.container.viewContext
    @Published var players = [Player]()
    @Published var myPlayers = [MyPlayers]()
    @Published var hiddenPlayers = [Player]()
    @Published var allPlayers = [Player]()
    @Published var num = 1
    @Published var tabSelectedIndex = 1
    let statistic = ["Points", "Rebounds", "Assists", "Steals", "Blocks", "Turnovers"]
    let position = ["All", "PG", "SG", "SF", "PF", "C"]
    let team = ["All", "ATL", "BRK", "BOS", "CHO", "CHI", "CLE", "DAL", "DEN", "DET", "GSW", "HOU", "IND", "LAC", "LAL", "MEM", "MIA", "MIL", "MIN", "NOP", "NYK", "OKC", "ORL", "PHO", "PHX", "POR", "SAC", "SAS", "TOR", "UTA", "WAS"]
    init(){
        //create an instance of data service and get the data
        checkLoadedData()
        allPlayers = players

    }
    
    func checkLoadedData() {
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded)
        if status == false {
            preloadLocalData()
        }
        else {
            fetchData()
            fetchMyPlayers()
        }
    }
    func preloadLocalData() {
        let localPlayers = DataService.getLocalData()
        for p in localPlayers {
           let player =  Player(context: managedObjectContext)
            player.id = UUID()
            player.age = p.age
            player.ast = p.ast
            player.blk = p.blk
            player.drb = p.drb
            player.efgp = p.efgp
            player.fg = p.fg
            player.fga = p.fga
            player.fgp = p.fgp
            player.ft = p.ft
            player.fta = p.fta
            player.ftp = p.ftp
            player.mp = p.mp
            player.orb = p.orb
            player.pf = p.pf
            player.pts = p.pts
            player.stl = p.stl
            player.thp = p.thp
            player.thpa = p.thpa
            player.thpp = p.thpp
            player.tov = p.tov
            player.trb = p.trb
            player.twp = p.twp
            player.twpa = p.twpa
            player.twpp = p.twpp
            player.g = p.g
            player.gs = p.gs
            player.name = p.name
            player.pos = p.pos
            player.rk = p.rk
            player.team = p.team
            players.append(player)
}

        do {
            try managedObjectContext.save()
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreloaded)

        }
        catch {
            
        }
            
        
        
    }
    func fetchData() {
        do {
            players = try managedObjectContext.fetch(Player.fetchRequest())
        } catch {
            print("Failed to fetch player data from Core Data: \(error)")
        }

    }
    
    func saveMyPlayer(id: UUID) {
            let newPlayer = MyPlayers(context: managedObjectContext)
            newPlayer.id = id
            
            myPlayers.append(newPlayer)
            
            do {
                try managedObjectContext.save()
            } catch {
                print("Error saving MyPlayer to Core Data: \(error)")
            }
        }
    
    func removeMyPlayer(_ myPlayer: MyPlayers) {
            if let index = myPlayers.firstIndex(of: myPlayer) {
                myPlayers.remove(at: index)
                managedObjectContext.delete(myPlayer)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print("Error removing MyPlayer from Core Data: \(error)")
                }
            }
        }
    
    func fetchMyPlayers() {
           let fetchRequest: NSFetchRequest<MyPlayers> = NSFetchRequest(entityName: "MyPlayers")
           
           do {
               myPlayers = try managedObjectContext.fetch(fetchRequest)
           } catch {
               print("Failed to fetch MyPlayers from Core Data: \(error)")
           }
       }
    
    func getPlayerByUUID(_ uuid: UUID) -> Player? {
            let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)
            fetchRequest.fetchLimit = 1
            
            do {
                let result = try managedObjectContext.fetch(fetchRequest)
                return result.first
            } catch {
                print("Error fetching player from Core Data: \(error)")
                return nil
            }
        }
    
    func getMyPlayerObjects() -> [Player] {
            var playerObjects = [Player]()
            
            for myPlayer in myPlayers {
                if let playerUUID = myPlayer.id {
                    if let player = getPlayerByUUID(playerUUID) {
                        playerObjects.append(player)
                    }
                }
            }
            
            return playerObjects
        }
    
    func sort (_ pos:String, _ tm:String, _ stat:String)->[Player] {
        var modifiedPlayers = players
        if pos != "All" {
            modifiedPlayers.removeAll { player in
                player.pos != pos
            }
        }
        if tm != "All" {
            modifiedPlayers.removeAll { player in
                player.team != tm
            }
        }
        if stat == "Points" {
            modifiedPlayers = modifiedPlayers.sorted {
                $0.pts > $1.pts
            }
        }
        if stat == "Rebounds" {
            modifiedPlayers = modifiedPlayers.sorted {
                $0.trb > $1.trb
            }
        }
        if stat == "Assists" {
            modifiedPlayers = modifiedPlayers.sorted {
                $0.ast > $1.ast
            }
        }
        if stat == "Steals" {
            modifiedPlayers = modifiedPlayers.sorted {
                $0.stl > $1.stl
            }
        }
        if stat == "Blocks" {
            modifiedPlayers = modifiedPlayers.sorted {
                $0.blk > $1.blk
            }
        }
        if stat == "Turnovers" {
            modifiedPlayers = modifiedPlayers.sorted {
                $0.tov > $1.tov
            }
        }
        return modifiedPlayers
        
        
    }
     func increment () {
        num += 1
    }
    func changeSelection (_ num:Int) {
        tabSelectedIndex = num
    }
}
