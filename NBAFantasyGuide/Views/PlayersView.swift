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
    
    var body: some View {
     
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    HStack(spacing: 10.0){
                        Picker("Position", selection: $selectionPos) {
                            ForEach(model.position, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("Team", selection: $selectionTeam) {
                            ForEach(model.team, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("Statistic", selection: $selectionStat) {
                            ForEach(model.statistic, id: \.self) {
                                Text($0)
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
                            .padding(.leading, 10)
                        }

                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    .frame(width: 1000)
                 
                 
                    //MARK: labels
                    HStack(spacing: 0){
                        Text("Rank")
                            .frame(width: 60)

                        Text("Name")
                            .padding(.horizontal, 50.0)
                            .frame(width: 195)
                        
                        Text(selectionStat)
                            .padding(.trailing, 40.0)
                            .frame(width: 110)
                            

                    }
                    .padding(.top, 10.0)
                    .padding(.trailing, 65)
                    .frame(width: 10)
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    
                    PlayerList(stat: model.sort(selectionPos, selectionTeam, selectionStat), remove: false, add: true, statShown: true, selectedStat: selectionStat, isMyTeamPlayer: false, isHidden: true)
                
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
