//
//  MyTeamView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct MyTeamView: View {
    var body: some View {
     NavigationView {
                ZStack{
                    BackgroundRectangle(opacity: 0.7)
                        .ignoresSafeArea()
                    VStack{
                        
                    }
            }
                .navigationTitle("My Team")                           .font(.custom("NotoSansKannada-Bold", size: 40))


        }
    }
}

struct MyTeamView_Previews: PreviewProvider {
    static var previews: some View {
        MyTeamView()
    }
}
