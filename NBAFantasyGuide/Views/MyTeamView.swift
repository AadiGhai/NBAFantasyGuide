//
//  MyTeamView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct MyTeamView: View {
    @EnvironmentObject var model:DataModel
    @State var team:[MyPlayers]
    @State var isSaved:Bool
    var body: some View {
     NavigationView {
                ZStack{
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    VStack{
                        if !isSaved {
                            HStack{
                            Button {
                                model.changeSelection(2)
                            } label: {
                                HStack{
                                    ZStack{
                                        BackgroundRectangle(opacity: 0.7)
                                            .frame(width: 170, height: 40, alignment: .center)
                                            .cornerRadius(20)
                                        Text("Add Players")
                                            .font(.custom("NotoSansKannada-Bold", size: 20))
                                            .accentColor(.black)
                                    }
                                    Spacer()
                                }
                                .padding(.leading)
                                
                                
                                
                            }
                            if model.myPlayers.count > 0 {
                                Button {
                                    model.saveTeam(withMyPlayers: model.myPlayers)
                                    model.removeAllMyPlayer()
                                    team.removeAll()
                                } label: {
                                    HStack{
                                        ZStack{
                                            BackgroundRectangle(opacity: 0.7)
                                                .frame(width: 170, height: 40, alignment: .center)
                                                .cornerRadius(20)
                                            Text("Save Team")
                                                .font(.custom("NotoSansKannada-Bold", size: 20))
                                                .accentColor(.black)
                                        }
                                        Spacer()
                                    }
                                    .padding(.leading)
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                        VStack(){
                            Text("Players")
                                .font(.custom("NotoSansKannada-Bold", size:25))
                            Divider()

                            PlayerList(stat: model.getMyPlayerObjects(mp: team), statShown: false, isHidden:false, isMyPlayer: true, isLabel: false)
                        }
                        VStack{
                            Text("Rookies")
                                .font(.custom("NotoSansKannada-Bold", size: 25))

                            Divider()

                            RookiePlayerList(players: model.getMyPlayerObjects(mp: team), isHidden: false, isLabel: false)
                        }
                        

                    }
            }
                .navigationTitle("My Team")
                .font(.custom("NotoSansKannada-Bold", size: 40))


        }
    }
}

