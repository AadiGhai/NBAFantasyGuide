//
//  DataService.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import Foundation
class DataService{
   static func getLocalData()->[Player]{
        //Parse local json file
        
        //get url path to json file
       let pathString = Bundle.main.path(forResource: "playerdata", ofType: "json")
        
        //check if pathstring is not will, otherwise...
        guard pathString != nil else{
            return [Player]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            //create data object

            let data = try Data(contentsOf: url)

            //decode data with JSON decoder
            let decoder = JSONDecoder()
            
            do{
                let playerData = try decoder.decode([Player].self, from: data)
                for p in playerData{
                    var pl = p
                    pl.id = UUID()
                }
                return playerData
            }
            catch{
                print(error)
            }
            //add unique ids
            
            //return recipes
        }
        catch{
            print(error)
        }
        return [Player]()

    }
}

