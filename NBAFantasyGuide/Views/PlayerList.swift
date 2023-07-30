//
//  PlayerList.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/26/23.
//

import SwiftUI

struct RankedPlayer: Identifiable {
    let id: Int // The Identifiable id
    let rank: Int
    let player: Player
}


struct PlayerList: View {
    @EnvironmentObject var model:DataModel
    var stat:[Player]?
    var statShown:Bool
    var selectedStat:String?
    var isHidden:Bool
    var isMyPlayer:Bool
    var isLabel:Bool
    var body: some View {
        
        let players = stat != nil ? stat:model.players
        let sortedPlayersWithRank = players!.enumerated().map { (index, player) in
                    RankedPlayer(id: index, rank: index + 1, player: player)
                }
        ScrollView{
            ForEach(sortedPlayersWithRank) { rankedPlayer in
                if rankedPlayer.player.isRookie != true{
                    ZStack {
                        BackgroundRectangle(opacity: 0.7)
                            .frame(width: 420, height: 40, alignment: .center)
                            .cornerRadius(20)
                        HStack(alignment: .center, spacing: 5.0){
                            if isLabel{
                                Text(String("\(rankedPlayer.rank)"))
                                    .frame(width: 50, alignment: .trailing)
                                .padding()
                                .offset(x: 7)
                            }
                            NavigationLink {
                                PlayerDetailView(player: rankedPlayer.player)
                            } label: {
                                Text(rankedPlayer.player.name)
                                    .frame(width: 195, alignment: .leading)
                            }
                            
                            
                            if statShown {
                                if selectedStat == "Points" {
                                    Text(String(rankedPlayer.player.pts))
                                        .padding(.trailing)
                                        .frame(width: 60)
                                }
                                if selectedStat == "Rebounds" {
                                    Text(String(rankedPlayer.player.trb))
                                        .padding(.trailing)
                                        .frame(width: 60)
                                }
                                if selectedStat == "Assists" {
                                    Text(String(rankedPlayer.player.ast))
                                        .padding(.trailing)
                                        .frame(width: 60)
                                }
                                if selectedStat == "Steals" {
                                    Text(String(rankedPlayer.player.stl))
                                        .padding(.trailing)
                                        .frame(width: 60)
                                }
                                if selectedStat == "Blocks" {
                                    Text(String(rankedPlayer.player.blk))
                                        .padding(.trailing)
                                        .frame(width: 60)
                                }
                                if selectedStat == "Turnovers" {
                                    Text(String(rankedPlayer.player.tov))
                                        .padding(.trailing)
                                        .frame(width: 60)
                                }
                                if selectedStat == "PFP Increase" {
                                    Text(MyTeamCalulations.fantasyPointIncrease(rankedPlayer.player))
                                        .padding(.trailing)
                                        .frame(width: 70)
                                }
                                
                            }
                            
                            
                            if (isMyPlayer){
                                Text(rankedPlayer.player.pos)
                                    .frame(width: 100)
                            }
                            if (!model.myPlayers.contains(where: { myPlayer in
                                myPlayer.id == rankedPlayer.player.id
                            }))
                            {
                                Button("+") {
                                    model.saveMyPlayer(id: rankedPlayer.player.id!)
                                }
                                .foregroundColor(.black)
                                .frame(width: 20)
                            }
                            
                            else {
                                
                                Button("-"){
                                    if let myPlayer = model.myPlayers.first(where: { $0.id == rankedPlayer.player.id }) {
                                        model.removeMyPlayer(myPlayer)
                                    }                            }
                                .foregroundColor(.black)
                                .frame(width: 20)
                                
                            }
                            if isHidden {
                                Button("Hide"){
                                    
                                    model.players.removeAll { object in
                                        object.rk == rankedPlayer.player.rk
                                    }
                                    model.hiddenPlayers.append(rankedPlayer.player)
                                    
                                }
                                .padding(.leading)
                                .foregroundColor(.black)
                                .frame(width: 60)
                                .offset(x:-5)
                            }
                            
                        }
                        .font(.custom("NotoSansKannada-SemiBold", size: 18))
                        
                        .padding(.trailing, 40.0)
                        .frame(alignment:.center)
                        .id(rankedPlayer.id)
                        
                    }
                }
                
                
            }
                    }
        
                    
                    
                    }
                    
                    }
