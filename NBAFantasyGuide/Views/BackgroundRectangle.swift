//
//  BackgroundRectangle.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import SwiftUI

struct BackgroundRectangle: View {
    var opacity:Double
    let gradient = LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
    var body: some View {
        Rectangle()
            .fill(gradient)
            .opacity(opacity)
    }
}

struct BackgroundRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundRectangle(opacity: 0.7)
    }
}
