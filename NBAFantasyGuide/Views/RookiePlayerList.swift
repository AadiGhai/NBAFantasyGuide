//
//  RookiePlayerList.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/25/23.
//

import SwiftUI
struct RookiePlayerList: View {
    @EnvironmentObject var model:DataModel
    var players:[Player]
    var isHidden:Bool
    var isLabel:Bool
    var body: some View {
        ScrollView{
            ForEach(players.sorted { $0.rk < $1.rk }) { player in
                if player.isRookie == true {
                    ZStack {
                        BackgroundRectangle(opacity: 0.7)
                            .frame(width: 420, height: 40, alignment: .center)
                            .cornerRadius(20)
                        HStack(alignment: .center, spacing: 5.0){
                            if isLabel{
                                Text(String(player.rk))
                                    .frame(width: 50, alignment: .trailing)
                                .padding()
                                .offset(x: -5)
                            }
                            NavigationLink {
                                PlayerDetailView(player: player)
                            } label: {
                                Text(player.name)
                                    .frame(width: 195, alignment: .leading)
                                    .offset(x: -5)

                            }
                            
                            Text(player.pos)
                                .frame(width: 50)
                                .offset(x: 5)

                            if (!model.myPlayers.contains(where: { myPlayer in
                                myPlayer.id == player.id
                            }))
                            {
                                Button("+") {
                                    model.saveMyPlayer(id: player.id!)
                                }
                                .foregroundColor(.black)
                                .frame(width: 20)
                                .offset(x: 5)

                            }
                            
                            else {
                                
                                Button("-"){
                                    if let myPlayer = model.myPlayers.first(where: { $0.id == player.id }) {
                                        model.removeMyPlayer(myPlayer)
                                    }                            }
                                .foregroundColor(.black)
                                .frame(width: 20)
                                .offset(x: 5)

                                
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
                                .offset(x: 5)

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
                    
                    }
