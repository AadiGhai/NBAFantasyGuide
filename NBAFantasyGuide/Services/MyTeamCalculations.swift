//
//  MyTeamCalculations.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 7/1/23.
//

import Foundation

class MyTeamCalulations {
    static func totalPoints (_ myPlayers:[Player])->String {
        var sum = 0.0
        for player in myPlayers {
            sum += player.pts
        }
        return String(format: "%.2f", sum)
    }
    static func totalRebounds (_ myPlayers:[Player])->String {
        var sum = 0.0
        for player in myPlayers {
            sum += player.trb
        }
        return String(format: "%.2f", sum)
    }
    static func totalAssists (_ myPlayers:[Player])->String {
        var sum = 0.0
        for player in myPlayers {
            sum += player.ast
        }
        return String(format: "%.2f", sum)
    }
    static func totalSteals (_ myPlayers:[Player])->String {
        var sum = 0.0
        for player in myPlayers {
            sum += player.stl
        }
        return String(format: "%.2f", sum)
    }
    static func totalBlocks (_ myPlayers:[Player])->String {
        var sum = 0.0
        for player in myPlayers {
            sum += player.blk
        }
        return String(format: "%.2f", sum)
    }
    static func totalTurnovers(_ myPlayers:[Player])->String {
        var sum = 0.0
        for player in myPlayers {
            sum += player.tov
        }
        return String(format: "%.2f", sum)
    }
}

