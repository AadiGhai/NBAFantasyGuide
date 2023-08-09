//
//  SavedTeamsView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 8/8/23.
//

import SwiftUI

struct SavedTeamsView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack{
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    ScrollView{
                        ForEach(model.savedTeams){ savedTeam in
                            NavigationLink(destination: MyTeamView(team: model.getMyPlayers(forSavedTeam: savedTeam), isSaved: true)) {
                                ZStack {
                                    BackgroundRectangle(opacity: 0.3)
                                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
                                        .cornerRadius(100)
                                        .shadow(radius: 10)
                                    
                                    VStack(alignment: .leading, spacing: geometry.size.height * 0.01) {
                                        HStack {
                                            Text("My Team")
                                                .font(.custom("NotoSansKannada-Bold", size: geometry.size.width * 0.1))
                                            
                                            Image(systemName: "person.3.sequence")
                                                .offset(x: geometry.size.width * 0.02, y: -geometry.size.height * 0.02)
                                                .font(.custom("NotoSansKannada-Bold", size: geometry.size.width * 0.1))
                                        }
                                        
                                        Text("Team Averages (from 2022-2023 Season): ")
                                            .padding(.bottom)
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Player Count: \(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam)).count)")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Points: \(MyTeamCalulations.totalPoints(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Rebounds: \(MyTeamCalulations.totalRebounds(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Assists: \(MyTeamCalulations.totalAssists(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Steals: \(MyTeamCalulations.totalSteals(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Blocks: \(MyTeamCalulations.totalBlocks(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Turnovers: \(MyTeamCalulations.totalTurnovers(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                        Text("Total Fantasy Points: \(MyTeamCalulations.totalFantasyPoints(model.getMyPlayerObjects(mp: model.getMyPlayers(forSavedTeam: savedTeam))))")
                                            .font(.custom("NotoSansKannada-Bold", size: geometry.size.width * 0.035))
                                    }
                                    .padding(.leading)
                                }
                            }
                            .foregroundColor(.black)
                        }
                    }

                }
            }
            .navigationBarTitle("Saved Teams")

        }
        
    }
}

struct SavedTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedTeamsView()
            .environmentObject(DataModel())
    }
}
