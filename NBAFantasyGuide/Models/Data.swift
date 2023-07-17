//
//  DataModel.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import Foundation

struct PlayerJSON: Decodable, Identifiable {
    var id:UUID?
    var rk:Int
    var name:String
    var pos:String
    var age:Int
    var team:String
    var g:Int
    var gs:Int
    var mp:Double
    var fg:Double
    var fga:Double
    var fgp:Double
    var thp:Double
    var thpa:Double
    var thpp:Double
    var twp:Double
    var twpa:Double
    var twpp:Double
    var efgp:Double
    var ft:Double
    var fta:Double
    var ftp:Double
    var orb:Double
    var drb:Double
    var trb:Double
    var ast:Double
    var stl:Double
    var blk:Double
    var tov:Double
    var pf:Double
    var pts:Double
}
