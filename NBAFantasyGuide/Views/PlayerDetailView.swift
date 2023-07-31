//
//  PlayerDetailView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/5/23.
//

import SwiftUI
struct CustomRowView: View {
    var detail: String
    var index: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                if index % 2 == 0 {
                    Color.blue.opacity(0.2)
                } else {
                    Color.purple.opacity(0.2)
                }

                Text(detail)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                    .padding(.vertical, 10) // Add vertical spacing between the text elements
            }
        }
    }
}


struct PlayerDetailView: View {
    @EnvironmentObject var model:DataModel
    var player:Player
    var body: some View {
        var detailElements = ["Fantasy Points: \(MyTeamCalulations.fantasyPoints(player))",
                              "Points: \(String(player.pts))",
                              "Rebounds: \(String(player.trb))",
                              "Assists: \(String(player.ast))",
                              "Field Goals Made: \(String(player.fg))",
                              "Field Goals Attempted: \(String(player.fga))",
                              "Field Goal Percentage: \(String(player.fgp))",
                              "Effective Field-Goal Percentage: \(String(player.efgp))",
                              "Three-Pointers Made: \(String(player.thp))",
                              "Three-Pointers Attempted: \(String(player.thpa))",
                              "Three-Pointers Percentage: \(String(player.thpp))",
                              "Two-Pointers Made: \(String(player.twp))",
                              "Two-Pointers Attempted: \(String(player.twpa))",
                              "Two-Pointers Percentage: \(String(player.twpp))",
                              "Free Throws Made: \(String(player.ft))",
                              "Free Throws Attempted: \(String(player.fta))",
                              "Free Throws Percentage: \(String(player.ftp))",
                              "Offensive Rebounds: \(String(player.orb))",
                              "Defensive Rebounds: \(String(player.drb))",
                              "Steals: \(String(player.stl))",
                              "Blocks: \(String(player.blk))",
                              "Turnovers: \(String(player.tov))",
                              "Personal Fouls: \(String(player.pf))"]
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 30.0){
                        
                        GeometryReader { geometry in
                            VStack {
                                ZStack(alignment: .topLeading) {
                                    Color.purple.opacity(0.2)
                                    Text("Position: \(player.pos)")
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                        .padding(.vertical, 10) // Add vertical spacing between the text elements
                                }
                                ZStack(alignment: .topLeading) {
                                    Color.blue.opacity(0.2)
                                    Text("Age: \(String(player.age))")
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                        .padding(.vertical, 10) // Add vertical spacing between the text elements
                                }
                                ZStack(alignment: .topLeading) {
                                    Color.purple.opacity(0.2)
                                    Text("Team: \(player.team)")
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                        .padding(.vertical, 10) // Add vertical spacing between the text elements
                                }
                                if player.isRookie == false {

                                    ZStack(alignment: .topLeading) {
                                        Color.blue.opacity(0.2)
                                        Text("Predicted Fantasy Point % Change: \(MyTeamCalulations.fantasyPointIncrease(player))")
                                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                            .padding(.vertical, 10) // Add vertical spacing between the text elements
                                    }
                                }
                                else {
                                    ZStack(alignment: .topLeading) {
                                        Color.blue.opacity(0.2)
                                        Text("Pick: \(player.rk)")
                                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                            .padding(.vertical, 10) // Add vertical spacing between the text elements
                                    }
                                    ZStack(alignment: .topLeading) {
                                        Color.purple.opacity(0.2)
                                        Text("Rookie")
                                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                            .padding(.vertical, 10) // Add vertical spacing between the text elements
                                    }
                                    if player.college != nil {
                                        ZStack(alignment: .topLeading) {
                                            Color.blue.opacity(0.2)
                                            Text("From: \(player.college!)")
                                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                                .padding(.vertical, 10) // Add vertical spacing between the text elements
                                        }

                                    }
                                }
                                
                            }
                        }
                            
                        
                        if player.isRookie != true {
                            Spacer()
                            Spacer()
                            Spacer()

                            Divider()
                            Text("Per-Game Stats from the 2022-2023 Season:")
                                .font(.custom("NotoSansKannada-Bold", size: 20))

                            ForEach(detailElements.indices, id: \.self) { index in
                                CustomRowView(detail: detailElements[index], index: index)
                                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                            
                            
                            Divider()
                            
                            Text("Totals from the 2022-2023 Season:")
                                .font(.custom("NotoSansKannada-Bold", size: 20))
                            
                            GeometryReader { geometry in
                                VStack {
                                    ZStack(alignment: .topLeading) {
                                        Color.blue.opacity(0.2)
                                        Text("Games Played: \(String(player.g))")
                                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                            .padding(.vertical, 10) // Add vertical spacing between the text elements
                                    }
                                    ZStack(alignment: .topLeading) {
                                        Color.purple.opacity(0.2)
                                        Text("Games Started: \(String(player.gs))")
                                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                                            .padding(.vertical, 10) // Add vertical spacing between the text elements
                                    }
                                    
                                }
                            }
                            Group{
                                Spacer()
                                Spacer()
                            }
                        }
                         
    
                        
                    }
                    .padding([.top, .leading])
                    .font(.custom("NotoSansKannada-Plain", size: 20))
                    
                    
                }
                
                
                
                
            }
            .navigationTitle(player.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !model.myPlayers.contains(where: { myPlayer in
                        myPlayer.id == player.id
                    }) {
                        Button(action: {
                            model.saveMyPlayer(id: player.id!)
                        }, label: {
                            Text("+")
                                .font(.custom("NotoSansKannada-Plain", size: 50))
                        })
                        .foregroundColor(.black)
                    } else {
                        Button(action: {
                            if let myPlayer = model.myPlayers.first(where: { $0.id == player.id }) {
                                model.removeMyPlayer(myPlayer)
                            }
                        }, label: {
                            Text("-")
                                .font(.custom("NotoSansKannada-Plain", size: 50))
                        })
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
