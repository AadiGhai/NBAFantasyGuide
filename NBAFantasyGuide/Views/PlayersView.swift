//
//  PlayersView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct PlayersView: View {
    @EnvironmentObject var model:DataModel
    @State var selectionTeam = "All"
    @State var selectionStat = "Points"
    @State var selectionPos = "All"
    @State var selectionPlayer = "Players"
    
    var body: some View {
     
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    Picker("", selection: $selectionPlayer) {
                        Text("Players").tag("Players")
                        Text("Rookies").tag("Rookies")

                    }
                    .pickerStyle(.segmented)
                    .frame(width: 400)
                    HStack(spacing: 10.0){
                        VStack{
                            Picker("Position", selection: $selectionPos) {
                                ForEach(model.position, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(width: 70)
                            Text("Position")
                                .font(.custom("NotoSansKannada-Bold", size: 15))

                        }
                       
                        VStack {
                            Picker("Team", selection: $selectionTeam) {
                                ForEach(model.team, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(width: 85)
                            Text("Team")
                                .font(.custom("NotoSansKannada-Bold", size: 15))
                                .padding(.trailing, 5)

                        }
                        if selectionPlayer == "Players"{
                            VStack {
                                Picker("Statistic", selection: $selectionStat) {
                                    ForEach(model.statistic, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .frame(width: 120)
                                
                                Text("Statistic")
                                    .font(.custom("NotoSansKannada-Bold", size: 15))
                                    .padding(.trailing, 5)
                                
                                
                            }
                        }
                       
                        if model.hiddenPlayers.count > 0 {
                            Button {
                                for player in model.hiddenPlayers {
                                    model.players.append(player)
                                }
                                model.hiddenPlayers.removeAll()
                            } label: {
                                ZStack{
                                    BackgroundRectangle(opacity: 0.7)
                                        .frame(width: 120, height: 40, alignment: .center)
                                        .cornerRadius(20)
                                    Text("Add Hidden")
                                        .bold()
                                }
                            }
                            .padding(.trailing, 10)
                        }

                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    .frame(width: 1000)
                 
                 
                    //MARK: labels
                    HStack(spacing: 0){
                        Text("Rk")
                            .padding(.leading, 50)
                            .frame(width: 80)

                        Text("Name")
                            .padding(.trailing, 100.0)
                            .frame(width: 195)
                        if selectionPlayer == "Players"{
                            Text(selectionStat)
                                .padding(.trailing, 60.0)
                                .frame(width: 150)
                        }
                        else {
                            Text("Position")
                                .padding(.trailing, 60.0)
                                .frame(width: 150)
                        }
                            

                    }
                    .padding(.top, 10.0)
                    .padding(.trailing, 65)
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    Divider()
                    if selectionPlayer == "Players"{
                        PlayerList(stat: model.sort(selectionPos, selectionTeam, selectionStat), statShown: true, selectedStat: selectionStat, isHidden: true, isMyPlayer: false, isLabel: true)
                    }
                    else {
                        RookiePlayerList(players: model.sort(selectionPos, selectionTeam, "None"), isHidden: true, isLabel: true)
                    }
                
                }
                .navigationTitle("Players")
            }

        }
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
            .environmentObject(DataModel())
    }
}
