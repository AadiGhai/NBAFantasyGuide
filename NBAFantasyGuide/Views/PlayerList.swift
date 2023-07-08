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
    var statShown:Bool
    var selectedStat:String?
    var isHidden:Bool
    var body: some View {
        let players = stat != nil ? stat:model.players
        ScrollView{
            ForEach(players!) { player in
                ZStack {
                    BackgroundRectangle(opacity: 0.7)
                        .frame(width: 420, height: 40, alignment: .center)
                        .cornerRadius(20)
                    HStack(alignment: .center, spacing: 5.0){
                        
                        Text(String(model.num))
                            .frame(width: 35, alignment: .center)
                            .padding()
                        NavigationLink {
                            PlayerDetailView(player: player)
                        } label: {
                            Text(player.name)
                                .frame(width: 195, alignment: .leading)
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
                        
                        
                        
                        if (!model.myPlayers.contains(where: { myPlayer in
                            myPlayer.rk == player.rk
                        }))
                        {
                            Button("+") {
                                model.myPlayers.append(player)
                            }
                            .foregroundColor(.black)
                            .frame(width: 20)
                        }
                        
                        else {
                            Button("-"){
                                
                                model.myPlayers.removeAll { object in
                                    object.rk == player.rk
                                }
                            }
                            .foregroundColor(.black)
                            .frame(width: 20)
                            
                        }
                        if isHidden {
                            Button("Hide"){
                                
                                model.players.removeAll { object in
                                    object.rk == player.rk
                                }
                                model.hiddenPlayers.append(player)
                                
                            }
                            .padding(.leading)
                            .foregroundColor(.black)
                            .frame(width: 60)
                        }
                        
                    }
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    
                    .padding(.trailing, 40.0)
                    .frame(alignment:.center)
                }
                
                
                
            }
        }
        
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(statShown: true, selectedStat: "Points", isHidden: true)
            .environmentObject(DataModel())
    }
}
