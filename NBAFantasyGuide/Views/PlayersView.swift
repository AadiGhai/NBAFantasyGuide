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
                    HStack(spacing: 30.0){
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
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                 
                 
                    //MARK: labels
                    HStack(spacing: 20.0){
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
                    .frame(alignment: .center)
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    
                    PlayerList(stat: model.sort(selectionPos, selectionTeam, selectionStat), remove: false, add: true)
                
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
