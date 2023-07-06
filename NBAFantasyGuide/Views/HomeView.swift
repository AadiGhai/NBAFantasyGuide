//
//  ContentView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: DataModel
    var body: some View {
        NavigationView {
            ZStack{
                
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack(spacing: 40.0){
                    //MARK: my team card
                    
                    NavigationLink {
                        MyTeamView()
                    } label: {
                        ZStack{
                            BackgroundRectangle(opacity: 0.3)
                                .frame(width: 350, height: 400)
                                .cornerRadius(100)
                                .shadow(radius: 10)
                            VStack(alignment: .leading, spacing: 10.0) {
                                HStack{
                                    Text("My Team")
                                        .font(.custom("NotoSansKannada-Bold", size: 40))
                                    
                                    //Image(nba)
                                }
                                
                                
                                Text("Team Averages (from 2022-2023 Season): ")
                                    .padding(.bottom)
                                
                                Text("Points: \(MyTeamCalulations.totalPoints(model.myPlayers))")
                                Text("Rebounds: \(MyTeamCalulations.totalRebounds(model.myPlayers))")
                                Text("Assists: \(MyTeamCalulations.totalAssists(model.myPlayers))")
                                Text("Steals: \(MyTeamCalulations.totalSteals(model.myPlayers))")
                                Text("Blocks: \(MyTeamCalulations.totalBlocks(model.myPlayers))")
                                Text("Turnovers: \(MyTeamCalulations.totalTurnovers(model.myPlayers))")

                                
                                
                            }
                            .padding(.leading)
                            .font(.custom("NotoSansKannada-Light", size: 16))
                            
                        }
                    }
                    .foregroundColor(.black)

                    
                    
                    
                    //MARK: articles card
                    ZStack {
                        BackgroundRectangle(opacity: 0.3)
                            .frame(width: 350, height: 300)
                            .cornerRadius(100)
                            .shadow(radius: 10)
                        VStack(alignment: .leading, spacing: 20){
                            Text("Articles")
                                .font(.custom("NotoSansKannada-Bold", size: 40))
                                .padding(.top, 10.0)
                            
                            Text("Article 1")
                            Text("Article 2")
                            Text("Article 3")
                            Text("                                                                 ")
                            
                            
                        }
                        .font(.custom("NotoSansKannada-Light", size: 16))
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
                
            
        }
        
        
        
    }
}
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DataModel())
    }
}
