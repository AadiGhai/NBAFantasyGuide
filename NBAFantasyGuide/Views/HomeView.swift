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
        GeometryReader { geometry in
            ZStack {
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                
                VStack {
                    Text("How the App Works") // Customize this text as per your needs
                        .font(.title)
                        .padding()
                    
                    Text("Add your explanation here.") // Add your detailed explanation here
                        .padding()
                        .font(.custom("NotoSansKannada-Light", size: 16))
                    
                    Button("Dismiss") {
                        isInfoPopupVisible = false
                    }
                    .padding()
                    .font(.custom("NotoSansKannada-Light", size: 16))
                }
                .frame(width: min(300, geometry.size.width * 0.8), height: min(200, geometry.size.height * 0.5))
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var model: DataModel
    @State private var isInfoPopupVisible = false
    
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
                                            .offset(x: geometry.size.width * 0.04, y: -geometry.size.height * 0.02)
                                            .font(.custom("NotoSansKannada-Bold", size: geometry.size.width * 0.12))
                                    }
                                    
                                    Text("Team Averages (from 2022-2023 Season): ")
                                        .padding(.bottom)
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                                    
                                    Text("Points: \(MyTeamCalulations.totalPoints(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                                    Text("Rebounds: \(MyTeamCalulations.totalRebounds(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                                    Text("Assists: \(MyTeamCalulations.totalAssists(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                                    Text("Steals: \(MyTeamCalulations.totalSteals(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                                    Text("Blocks: \(MyTeamCalulations.totalBlocks(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                                    Text("Turnovers: \(MyTeamCalulations.totalTurnovers(model.getMyPlayerObjects()))")
                                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
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
                                .frame(height: geometry.size.height*0.22)
                                .offset(x: geometry.size.width * -0.02)
                            }
                            .padding(.leading)
                        }
                        .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                        
                        //MARK: Info button
                        HStack {
                            Spacer()
                            Button(action: {
                                isInfoPopupVisible = true
                            }) {
                                Image(systemName: "info.circle")
                                    .imageScale(.large)
                                    .font(.custom("NotoSansKannada-Light", size: geometry.size.width * 0.04))
                            }
                            .offset(y: geometry.size.height * -0.055)
                        }
                        .foregroundColor(.blue)
                        .padding(.trailing, geometry.size.width * 0.03)
                        .sheet(isPresented: $isInfoPopupVisible) {
                            InfoPopupView(isInfoPopupVisible: $isInfoPopupVisible)
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
