//
//  PlayerList.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/26/23.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct PlayerList: View {
    @EnvironmentObject var model:DataModel
    var stat:[Player]?
    var remove:Bool
    var add:Bool
    var statShown:Bool
    var selectedStat:String?
    var isMyTeamPlayer:Bool
    var body: some View {
        let players = stat != nil ? stat:model.players
        ScrollView{
            ForEach(players!) { player in

                HStack(alignment: .center, spacing: 5.0){
                    
                    Text(String(model.num))
                        .frame(width: 60, alignment: .center)
                        .padding()
                    
                    NavigationLink {
                        if isMyTeamPlayer{
                            PlayerDetailView(player: player, isMyPlayer:true)
                        }
                        else {
                            PlayerDetailView(player: player, isMyPlayer:false)
                        }
                    } label: {
                        Text(player.name)
                            .frame(width: 195)
                    }
                   
                    
                    if statShown {
                        if selectedStat == "Points" {
                            Text(String(player.pts))
                                .padding(.trailing)
                                .frame(width: 60)
                        }
                        if selectedStat == "Rebounds" {
                            Text(String(player.trb))
                                .padding(.trailing)
                                .frame(width: 60)
                        }
                        if selectedStat == "Assists" {
                            Text(String(player.ast))
                                .padding(.trailing)
                                .frame(width: 60)
                        }
                        if selectedStat == "Steals" {
                            Text(String(player.stl))
                                .padding(.trailing)
                                .frame(width: 60)
                        }
                        if selectedStat == "Blocks" {
                            Text(String(player.blk))
                                .padding(.trailing)
                                .frame(width: 60)
                        }
                        if selectedStat == "Turnovers" {
                            Text(String(player.tov))
                                .padding(.trailing)
                                .frame(width: 60)
                        }

                    }

                    
                    if add{
                        Button("+") {
                            model.myPlayers.append(player)
                            model.players.removeAll { object in
                                object.id == player.id
                            }
                        }
                        .foregroundColor(.black)
                    }
                    if remove{
                        Button("-"){
                            
                            model.myPlayers.removeAll { object in
                                object.id == player.id
                            }
                            model.players.append(player)
                            
                        }
                        .foregroundColor(.black)

                    }
             
                }
                .font(.custom("NotoSansKannada-SemiBold", size: 18))

                .padding(.trailing, 40.0)
                .frame(alignment:.center)


                    
            }
        }

    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(remove: true, add: true, statShown: true, selectedStat: "Points", isMyTeamPlayer: true)
            .environmentObject(DataModel())
    }
}
