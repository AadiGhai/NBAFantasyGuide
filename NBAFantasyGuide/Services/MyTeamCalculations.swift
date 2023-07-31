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
    static func fantasyPoints(_ player: Player) -> String {
        let points = player.pts
        let rebounds = player.trb * 1.2
        let assists = player.ast * 1.5
        let steals = player.stl * 3
        let blocks = player.blk * 3
        let turnovers = player.tov
        let games = player.g
        
        let sum = points + rebounds + assists + steals + blocks + turnovers
        let total = sum * Double(games)
        
        return String(format: "%.0f", total)
    }
    static func totalFantasyPoints(_ players: [Player]) -> String {
        var sum = 0.0
        
        for player in players {
            sum += Double(MyTeamCalulations.fantasyPoints(player))!
        }
        
        return String(format: "%.2f", sum)
    }

    static func fantasyPointIncrease(_ player: Player) -> String {
            // Intermediate variables to store sub-expression results
            let pointsFactor = 1 * player.pts
            let personalFoulsFactor = -0.7 * player.pf
            let turnoversFactor = -1.0 * player.tov
        let blocksFactor = 0.8 * player.blk
        let stealsFactor = 0.9 * player.stl
        let assistsFactor = 0.99 * player.ast
        let totalReboundsFactor = 0.4 * player.trb
            let defensiveReboundsFactor = 0.6 * player.drb
            let offensiveReboundsFactor = 0.8 * player.orb
        let freeThrowPercentageFactor = 2 * player.ftp
            let freeThrowsAttemptedFactor = -0.2 * player.fta
            let freeThrowsMadeFactor = 0.25 * player.ft
            let effectiveFieldGoalPercentageFactor = 1 * player.efgp
        let twoPointPercentageFactor = 0.8 * player.twpp
            let twoPointersAttemptedFactor = -0.07 * player.twpa
            let twoPointersMadeFactor = 0.2 * player.twp
        let threePointPercentageFactor = 0.5 * player.thpp
            let threePointersAttemptedFactor = -0.05 * player.thpa
        let threePointersMadeFactor = 0.9 * player.thp
        let fieldGoalPercentageFactor = 3 * player.fgp
            let fieldGoalsAttemptedFactor = -0.3 * player.fga
            let fieldGoalsMadeFactor = 0.7 * player.fg
            let minutesPlayedFactor = -0.35 * player.mp
        let gamesStartedFactor = -0.5 * Double(player.gs)
            let gamesPlayedFactor = 0.2 * Double(player.g)
            let ageFactor = -0.9 * Double(player.age)
            
            // Calculate the sum of all factors
            let sum =  14 + pointsFactor + personalFoulsFactor + turnoversFactor + blocksFactor + stealsFactor + assistsFactor
                    + totalReboundsFactor + defensiveReboundsFactor + offensiveReboundsFactor + freeThrowPercentageFactor
                    + freeThrowsAttemptedFactor + freeThrowsMadeFactor + effectiveFieldGoalPercentageFactor
                    + twoPointPercentageFactor + twoPointersAttemptedFactor + twoPointersMadeFactor
                    + threePointPercentageFactor + threePointersAttemptedFactor + threePointersMadeFactor
                    + fieldGoalPercentageFactor + fieldGoalsAttemptedFactor + fieldGoalsMadeFactor
                    + minutesPlayedFactor + gamesStartedFactor + gamesPlayedFactor + ageFactor

            return String(format: "%.1f", sum)
        }




}


