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
                VStack(alignment: .center) {
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
                    
                    PlayerList()
                
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
