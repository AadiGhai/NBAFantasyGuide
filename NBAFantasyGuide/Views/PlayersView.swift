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
            VStack {
                ForEach(model.players) { player in
                    Text(player.name)
                        .font(.title)
                }
            }
        }
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
