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
        ZStack{
            BackgroundRectangle(opacity: 0.7)
                .ignoresSafeArea()
            VStack {
                Text("How the App Works") // Customize this text as per your needs
                    .font(.title)
                    .padding()
                Text("Add your explanation here.") // Add your detailed explanation here
                    .padding()
                Button("Dismiss") {
                   isInfoPopupVisible = false
                }
                .padding()
                .font(.custom("NotoSansKannada-Light", size: 16))
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        
    }
}

struct HomeView: View {
    @EnvironmentObject var model: DataModel
    @State private var isInfoPopupVisible = false
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack(spacing: 40.0){
                    //MARK: my team card
                    Spacer()
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
                                    Image(systemName: "person.3.sequence")
                                        .offset(x:20, y:-10)
                                        .font(.custom("NotoSansKannada-Bold", size: 40))
                                }
                                
                                
                                Text("Team Averages (from 2022-2023 Season): ")
                                    .padding(.bottom)
                                
                                Text("Points: \(MyTeamCalulations.totalPoints(model.getMyPlayerObjects()))")
                                Text("Rebounds: \(MyTeamCalulations.totalRebounds(model.getMyPlayerObjects()))")
                                Text("Assists: \(MyTeamCalulations.totalAssists(model.getMyPlayerObjects()))")
                                Text("Steals: \(MyTeamCalulations.totalSteals(model.getMyPlayerObjects()))")
                                Text("Blocks: \(MyTeamCalulations.totalBlocks(model.getMyPlayerObjects()))")
                                Text("Turnovers: \(MyTeamCalulations.totalTurnovers(model.getMyPlayerObjects()))")

                                
                                
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
                                .offset(x:-10, y:30)
                            Spacer()
                            ScrollView{
                                ForEach(model.articles) { article in
                                    ArticleButton(articleName: article.articleName, articleURL: article.articleURL)
                                }
                            }
                           .offset(y:-20)
                            
                        
                       
                            
                            
                        }
                        .font(.custom("NotoSansKannada-Light", size: 16))
                        
                        
                        
                    }
                    
                    //MARK: Info button
                    HStack{
                        Spacer()
                        Button(action: {
                                        isInfoPopupVisible = true
                                    }) {
                                        Image(systemName: "info.circle")
                                            .imageScale(.large)
                                            .font(.custom("NotoSansKannada-Light", size: 16))
                                    }
                                }
                    .foregroundColor(.blue)
                    .offset(y: -55)
                    .padding(.trailing, 20)
                    .sheet(isPresented: $isInfoPopupVisible) {
                                InfoPopupView(isInfoPopupVisible: $isInfoPopupVisible)
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
