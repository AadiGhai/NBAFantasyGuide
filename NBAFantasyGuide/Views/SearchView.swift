//
//  SearchView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/26/23.
//

import SwiftUI

struct SearchView: View {
    @State var input = ""
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundRectangle(opacity: 0.7)
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    TextField("Type here", text: $input)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("Search")
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
