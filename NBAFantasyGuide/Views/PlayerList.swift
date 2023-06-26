//
//  PlayerList.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/26/23.
//

import SwiftUI

struct PlayerList: View {
    @EnvironmentObject var model:DataModel
    var stat:[Player]?
    var body: some View {
        let players = stat != nil ? stat:model.players
        ScrollView{
            ForEach(players!) { player in
                HStack(alignment: .center, spacing: 5.0){
                    Text(String(player.rk))
                        .frame(width: 60, alignment: .center)
                        .padding()
                        
                    Text(player.name)
                        .frame(width: 195)

                    Text(String(player.pts))
                        .padding(.trailing)
                        .frame(width: 60)
                    
                    Button("+") {
                        model.myPlayers.append(player)
                    }
                    Button("-"){
                       
                        model.myPlayers.removeAll { object in
                            object.id == player.id
                        }
                        
                    }
                }
                .font(.custom("NotoSansKannada-SemiBold", size: 18))

                .padding(.trailing, 40.0)
                .frame(alignment:.center)

                
                    
            }
        }

    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
            .environmentObject(DataModel())
    }
}
