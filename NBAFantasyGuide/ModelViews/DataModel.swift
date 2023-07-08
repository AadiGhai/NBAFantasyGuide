//
//  DataModelView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import Foundation
class DataModel:ObservableObject{
    @Published var players = [Player]()
    @Published var myPlayers = [Player]()
    @Published var hiddenPlayers = [Player]()
    @Published var allPlayers = [Player]()
    @Published var num = 1
    @Published var tabSelectedIndex = 1
    let statistic = ["Points", "Rebounds", "Assists", "Steals", "Blocks", "Turnovers"]
    let position = ["All", "PG", "SG", "SF", "PF", "C"]
    let team = ["All", "ATL", "BKN", "BOS", "CHA", "CHI", "CLE", "DAL", "DEN", "DET", "GSW", "HOU", "IND", "LAC", "LAL", "MEM", "MIA", "MIL", "MIN", "NOP", "NYK", "OKC", "ORL", "PHI", "PHX", "POR", "SAC", "SAS", "TOR", "UTA", "WAS"]
    init(){
        //create an instance of data service and get the data
        self.players = DataService.getLocalData()
        self.allPlayers = DataService.getLocalData()
        
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
