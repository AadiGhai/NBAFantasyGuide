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
    static func fantasyPoints(_ players:[Player]) ->String {
        var sum = 0.0
        for player in players {
            sum += player.pts + (1.2)*(player.trb) + (1.5)*(player.ast) + (3)*(player.stl) + (3)*(player.blk) + (-1)*(player.tov)
        }
        return String(format: "%.2f", sum)
    }
    static func fantasyPointIncrease(_ player: Player) -> String {
            // Intermediate variables to store sub-expression results
            let pointsFactor = 0.2 * player.pts
            let personalFoulsFactor = -0.7 * player.pf
            let turnoversFactor = -1.0 * player.tov
            let blocksFactor = 0.8 * player.blk
            let stealsFactor = 1.5 * player.stl
            let assistsFactor = 1.2 * player.ast
            let totalReboundsFactor = 1.0 * player.trb
            let defensiveReboundsFactor = 0.6 * player.drb
            let offensiveReboundsFactor = 0.5 * player.orb
            let freeThrowPercentageFactor = 7.5 * player.ftp
            let freeThrowsAttemptedFactor = -0.1 * player.fta
            let freeThrowsMadeFactor = 0.25 * player.ft
            let effectiveFieldGoalPercentageFactor = 12.0 * player.efgp
            let twoPointPercentageFactor = 8.0 * player.twpp
            let twoPointersAttemptedFactor = -0.07 * player.twpa
            let twoPointersMadeFactor = 0.2 * player.twp
            let threePointPercentageFactor = 10.0 * player.thpp
            let threePointersAttemptedFactor = -0.05 * player.thpa
            let threePointersMadeFactor = 0.3 * player.thp
            let fieldGoalPercentageFactor = 15.0 * player.fgp
            let fieldGoalsAttemptedFactor = -0.1 * player.fga
            let fieldGoalsMadeFactor = 0.4 * player.fg
            let minutesPlayedFactor = 0.05 * player.mp
            let gamesStartedFactor = 0.3 * Double(player.gs)
            let gamesPlayedFactor = 0.15 * Double(player.g)
            let ageFactor = -0.2 * Double(player.age)
            
            // Calculate the sum of all factors
            let sum = 10.0 + pointsFactor + personalFoulsFactor + turnoversFactor + blocksFactor + stealsFactor + assistsFactor
                    + totalReboundsFactor + defensiveReboundsFactor + offensiveReboundsFactor + freeThrowPercentageFactor
                    + freeThrowsAttemptedFactor + freeThrowsMadeFactor + effectiveFieldGoalPercentageFactor
                    + twoPointPercentageFactor + twoPointersAttemptedFactor + twoPointersMadeFactor
                    + threePointPercentageFactor + threePointersAttemptedFactor + threePointersMadeFactor
                    + fieldGoalPercentageFactor + fieldGoalsAttemptedFactor + fieldGoalsMadeFactor
                    + minutesPlayedFactor + gamesStartedFactor + gamesPlayedFactor + ageFactor

            return String(format: "%.1f", sum)
        }




}


