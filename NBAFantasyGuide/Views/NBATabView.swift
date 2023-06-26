//
//  TabView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct NBATabView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")

                    }
                }
            PlayersView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Players")
                }
            Text("Search bar")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
        .foregroundColor(.black)
        .font(.custom("NotoSansKannada-Bold", size: 2))

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        NBATabView()
            .environmentObject(DataModel())
    }
}
