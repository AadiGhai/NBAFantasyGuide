//
//  ContentView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import SwiftUI

struct InfoPopupView: View {
    @Binding var isInfoPopupVisible: Bool
    
    var body: some View {
        let gradient = LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)

        GeometryReader { geometry in
            ZStack {
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack{
                    ScrollView {
                        VStack {
                            Text("How the App Works") // Customize this text as per your needs
                                .font(.custom("NotoSansKannada-Bold", size: 20))                                .padding()
                            
                            Text("Welcome to Basketball Fantasy Guide! Here, you can sort through all NBA players by position, team, and statistics of the prior NBA season, and find the players just right for your team in your upcoming fantasy drafts. In live drafts, you can use our 'Hide' feature to remove players that have already been taken in the draft and select from the available players. You can use the Predicted Fantasy Point (PFP) % Change feature to browse players that are predicted to grow the most in the upcoming NBA season, as well as find players that won't perform as well as the previous season. You can add players to your team and construct a good team that can be successful in the upcoming fantasy season. By clicking on a player's name, you can see the player's advanced statistics and decide whether you want to add them to your team. There is no requirement for games played when the players are sorted by statistic. For players that have been on multiple teams the past season, their team is shown as 'TOT' (Two-Other-Teams), meaning the player has played for two or more teams, and they would not be under the category of their present team. Since rookies don't have consistent statistics from their previous years, their pick numbers are shown instead of their statistics, and adding rookies to your team will not affect the team statistics that are displayed in the home view. While considering statistics is important in selecting your team, knowledge of current NBA news and predictions is also important to consider. Articles written by us are displayed in the home view and are encouraged to read when deciding which players to select. Statistics will be updated throughout the regular season. Have fun choosing your team and good luck for the upcoming NBA fantasy season! ")
                                .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                               Text("Data provided by Basketball Reference")// Add your detailed explanation here
                                .padding()
                                .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))

                            
                        }

                    }
                    Button("Dismiss") {
                        isInfoPopupVisible = false
                    }
                    .padding()
                    .font(.custom("NotoSansKannada-Bold", size: 16))
                }
                .padding()
                .background(gradient)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var model: DataModel
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    
                    VStack(spacing: geometry.size.height * 0.03) {
                        Spacer()
                        
                        //MARK: my team card
                        NavigationLink(destination: MyTeamView()) {
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
                                    Text("Player Count: \(model.getMyPlayerObjects().count)")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Points: \(MyTeamCalulations.totalPoints(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Rebounds: \(MyTeamCalulations.totalRebounds(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Assists: \(MyTeamCalulations.totalAssists(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Steals: \(MyTeamCalulations.totalSteals(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Blocks: \(MyTeamCalulations.totalBlocks(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Turnovers: \(MyTeamCalulations.totalTurnovers(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.035))
                                    Text("Total Fantasy Points: \(MyTeamCalulations.totalFantasyPoints(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Bold", size: geometry.size.width * 0.035))
                                }
                                .padding(.leading)
                            }
                        }
                        .foregroundColor(.black)
                        
                        //MARK: articles card
                        ZStack {
                            BackgroundRectangle(opacity: 0.3)
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.4)
                                .cornerRadius(100)
                                .shadow(radius: 10)
                            
                            VStack(alignment: .leading, spacing: geometry.size.height * 0.015) {
                                Text("Articles")
                                    .font(.custom("NotoSansKannada-Bold", size: geometry.size.width * 0.1))
                                    .offset(x: -geometry.size.width * 0.05, y: geometry.size.height * 0.01)
                                
                                ScrollView {
                                    ForEach(model.articles) { article in
                                        ArticleButton(articleName: article.articleName, articleURL: article.articleURL)
                                    }
                                }
                                .frame(width: geometry.size.width * 0.4, height: geometry.size.height*0.22)
                                .offset(x: geometry.size.width * -0.02)
                            }
                            .padding(.leading)
                        }
                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                        
                        //MARK: Info button
                        HStack {
                            Spacer()
                            Button(action: {
                                model.isInfoPopupVisible = true
                            }) {
                                Image(systemName: "info.circle")
                                    .imageScale(.large)
                                    .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                            }
                            .offset(y: geometry.size.height * -0.055)
                        }
                        .foregroundColor(.blue)
                        .padding(.trailing, geometry.size.width * 0.03)
                        .sheet(isPresented: $model.isInfoPopupVisible) {
                            InfoPopupView(isInfoPopupVisible: $model.isInfoPopupVisible)
                        }
                        
                    }
                    .padding(.trailing, 1)
                }
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
