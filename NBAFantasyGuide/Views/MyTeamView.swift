//
//  MyTeamView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct MyTeamView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
     NavigationView {
                ZStack{
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    VStack{
                        Button {
                            model.changeSelection(2)
                        } label: {
                            HStack{
                                ZStack{
                                    BackgroundRectangle(opacity: 0.7)
                                        .frame(width: 170, height: 40, alignment: .center)
                                        .cornerRadius(20)
                                    Text("Add Players")
                                        .font(.custom("NotoSansKannada-Bold", size: 20))
                                        .accentColor(.black)
                                }
                                Spacer()
                            }
                            .padding(.leading)
                   
                            
                        }
                        VStack(){
                            Text("Players")
                                .font(.custom("NotoSansKannada-Bold", size:25))
                            Divider()

                            PlayerList(stat: model.getMyPlayerObjects(), statShown: false, isHidden:false, isMyPlayer: true, isLabel: false)
                        }
                        VStack{
                            Text("Rookies")
                                .font(.custom("NotoSansKannada-Bold", size: 25))

                            Divider()

                            RookiePlayerList(players: model.getMyPlayerObjects(), isHidden: false, isLabel: false)
                        }
                        

                    }
            }
                .navigationTitle("My Team")
                .font(.custom("NotoSansKannada-Bold", size: 40))


        }
    }
}

struct MyTeamView_Previews: PreviewProvider {
    static var previews: some View {
        MyTeamView()
            .environmentObject(DataModel())
    }
}
