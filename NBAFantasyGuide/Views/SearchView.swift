//
//  SearchView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/26/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var model:DataModel
    @State private var searchText = ""
    var body: some View {
        NavigationView {
                ZStack {
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    ScrollView {
                        PlayerList(stat: searchResults, statShown: false, isHidden: false)
                       
                    }
                    .navigationTitle("Search")
                    .toolbar {
                        
                    }
                
                }
                .searchable(text: $searchText, prompt: "Search For Any Player")                    .font(.custom("NotoSansKannada-SemiBold", size: 18))



        }
        
    }
    var searchResults: [Player] {
        if searchText.isEmpty {
            return model.allPlayers
        } else {
            return model.allPlayers.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
      
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(DataModel())
    }
}
