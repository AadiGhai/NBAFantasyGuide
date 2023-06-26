//
//  PlayersView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct PlayersView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
     
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack {
                    //MARK: labels
                    HStack(spacing: 20.0){
                        Text("Rank")
                        Text("Name")
                            .padding(.horizontal)
                        Text("Team")
                        Text("POS")
                        Text("Stat")
                        Text("+")
                        Text("-")
                    }
                    .padding(.top, 10.0)
                    .font(.custom("NotoSansKannada-SemiBold", size: 20))
                    ScrollView{
                        ForEach(model.players) { player in
                            HStack(spacing: 30.0){
                                Text(String(player.rk))
                                Text(player.name)
                                Text(player.team)
                                Text(player.pos)
                                Text(String(player.pts))
                            }
                            .padding(.trailing, 40.0)
                            
                           
                                
                        }
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
