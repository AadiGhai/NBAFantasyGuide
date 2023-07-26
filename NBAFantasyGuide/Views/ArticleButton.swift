//
//  ArticleButton.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/25/23.
//

import SwiftUI

struct ArticleButton: View {
    var articleName:String
    var articleURL:String
    var body: some View {
        ZStack{
            BackgroundRectangle(opacity: 1.0)
                .frame(width:250, height: 40)
                .cornerRadius(30)
                .shadow(radius: 5)
            Link(articleName, destination: URL(string: articleURL)!)
                .font(.custom("NotoSansKannada-Bold", size: 16))

        }
    }
}

struct ArticleButton_Previews: PreviewProvider {
    static var previews: some View {
        ArticleButton(articleName: "Visit OpenAI", articleURL: "https://openai.com")
    }
}
