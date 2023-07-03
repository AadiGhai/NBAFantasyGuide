//
//  PlayersView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct PlayersView: View {
    @EnvironmentObject var model:DataModel
    @State var selection = ""
    let statistic = ["Points", "Rebounds", "Assists", "Steals", "Blocks", "Turnovers"]
    var body: some View {
     
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                 
                    /*Picker("Statistic", selection: $selection) {
                        ForEach(statistic, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)*/
                    //MARK: labels
                    HStack(spacing: 20.0){
                        Text("Rank")
                            .frame(width: 60)

                        Text("Name")
                            .padding(.horizontal, 50.0)
                            .frame(width: 195)
                        
                        Text("Fantasy Points")
                            .padding(.trailing, 40.0)
                            .frame(width: 110)
                            

                    }
                    .padding(.top, 10.0)
                    .frame(alignment: .center)
                    .font(.custom("NotoSansKannada-SemiBold", size: 18))
                    
                    PlayerList(remove: false, add: true)
                
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
