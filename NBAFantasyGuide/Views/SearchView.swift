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
        Text("Hello World")
        NavigationView {
                ZStack {
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    ScrollView {
                        PlayerList(stat: searchResults, remove: false, add: false, statShown: false, isMyTeamPlayer: false, isHidden: false)
                       
                    }
                    .navigationTitle("Search")
                    .toolbar {
                        
                    }
                
                }
                .searchable(text: $searchText)
            

        }
        
    }
    var searchResults: [Player] {
        if searchText.isEmpty {
            return model.players
        } else {
            return model.players.filter { $0.name.contains(searchText) }
        }
      
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(DataModel())
    }
}
