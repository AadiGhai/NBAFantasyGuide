//
//  TabView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct NBATabView: View {
    @EnvironmentObject var model:DataModel
    let gradient = LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
    var body: some View {
        TabView(selection: $model.tabSelectedIndex) {
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
        .onAppear {
                   let appearance = UITabBarAppearance()
                   appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                   appearance.backgroundColor = UIColor(Color.blue.opacity(0.0))
                   // Use this appearance when scrolling behind the TabView:
                   UITabBar.appearance().standardAppearance = appearance
                   // Use this appearance when scrolled all the way up:
                   UITabBar.appearance().scrollEdgeAppearance = appearance
               }
    }

}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        NBATabView()
            .environmentObject(DataModel())
    }
}
