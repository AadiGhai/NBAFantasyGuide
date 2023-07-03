//
//  PlayerList.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/26/23.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct PlayerList: View {
    @EnvironmentObject var model:DataModel
    var stat:[Player]?
    var remove:Bool
    var add:Bool
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
                    if add{
                        Button("+") {
                            model.myPlayers.append(player)
                        }
                    }
                    if remove{
                        Button("-"){
                            
                            model.myPlayers.removeAll { object in
                                object.id == player.id
                            }
                            
                        }
                    }
             
                }
                .font(.custom("NotoSansKannada-SemiBold", size: 18))

                .padding(.trailing, 40.0)
                .frame(alignment:.center)

                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                    
            }
        }

    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(remove: true, add: true)
            .environmentObject(DataModel())
    }
}
