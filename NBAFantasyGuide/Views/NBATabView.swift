//
//  TabView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct NBATabView: View {
    @EnvironmentObject var model:DataModel
    @State var selectedIndex = 1
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")

                    }
                }
                .tag(1)
            PlayersView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Players")
                }
                .tag(2)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(3)
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
