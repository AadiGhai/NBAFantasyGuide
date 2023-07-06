//
//  PlayerDetailView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/5/23.
//

import SwiftUI

struct PlayerDetailView: View {
    @EnvironmentObject var model:DataModel
    var player:Player
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 30.0){
                        Text("Position: \(player.pos)")
                        Text("Age: \(String(player.age))")
                        Text("Team: \(player.team)")
                        Divider()
                        Text("Per-Game Stats from the 2022-2023 Season:")
                            .bold()
                        Group {
                            Text("Points: \(String(player.pts))")
                            Text("Rebounds: \(String(player.trb))")
                            Text("Assists: \(String(player.ast))")
                            Text("Field Goals Made: \(String(player.fg))")
                            Text("Field Goals Attempted: \(String(player.fga))")
                            Text("Field Goal Percentage: \(String(player.fgp))")
                            Text("Effective Field-Goal Percentage: \(String(player.efgp))")
                            Text("Three-Pointers Made: \(String(player.thp))")
                            Text("Three-Pointers Attempted: \(String(player.thpa))")
                            Text("Three-Pointers Percentage: \(String(player.thpp))")
                        }
                        Group {
                            Text("Two-Pointers Made: \(String(player.twp))")
                            Text("Two-Pointers Attempted: \(String(player.twpa))")
                            Text("Two-Pointers Percentage: \(String(player.twpp))")
                            Text("Free Throws Made: \(String(player.ft))")
                            Text("Free Throws Attempted: \(String(player.fta))")
                            Text("Free Throws Percentage: \(String(player.ftp))")
                            Text("Offensive Rebounds: \(String(player.orb))")
                            Text("Defensive Rebounds: \(String(player.drb))")

                        }
                        Group{
                            Text("Steals: \(String(player.stl))")
                            Text("Blocks: \(String(player.blk))")
                            Text("Turnovers: \(String(player.tov))")
                            Text("Personal Fouls: \(String(player.pf))")
                            Divider()
                            Text("Totals from the 2022-2023 Season:")
                                .bold()
                            Divider()
                            Text("Games Played: \(String(player.g))")
                            Text("Games Started: \(String(player.gs))")

                        }
                        
                      


                    }
                    .padding([.top, .leading])
                    .font(.custom("NotoSansKannada-Plain", size: 20))

                    
                }
              

                
                
            }
            .navigationTitle(player.name)
            .toolbar {
                Button("+") {
                    model.myPlayers.append(player)
                }
                .foregroundColor(.black)
                .font(.custom("NotoSansKannada-Plain", size: 50))
                
            }
        }

    }
}

struct PlayerDetailView_Previews: PreviewProvider {
    @EnvironmentObject var model:DataModel

    static var previews: some View {
        PlayerDetailView(player: Player(rk: 1, name: "Lebron James", pos: "PG", age: 30, team: "LAL", g: 30, gs: 30, mp: 40, fg: 60, fga: 80, fgp: 55.5, thp: 37, thpa: 39, thpp: 72, twp: 47, twpa: 73, twpp: 23, efgp: 23, ft: 34, fta: 45, ftp: 67, orb: 43, drb: 65, trb: 34, ast: 54, stl: 34, blk: 76, tov: 46, pf: 66, pts: 99))
            .environmentObject(DataModel())
    }
}
