//
//  DataService.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/25/23.
//

import Foundation
import CoreData
class DataService{
    static func getLocalData()->[PlayerJSON]{
        
        //Parse local json file
        
        //get url path to json file
        let pathString = Bundle.main.path(forResource: "playerdata", ofType: "json")
        
        //check if pathstring is not will, otherwise...
        guard pathString != nil else{
            return [PlayerJSON]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            //create data object
            
            let data = try Data(contentsOf: url)
            
            //decode data with JSON decoder
            let decoder = JSONDecoder()
            
            do{
                var playerData = try decoder.decode([PlayerJSON].self, from: data)
                for index in 0..<playerData.count {
                    //add unique ids
                    playerData[index].id = UUID()
                    if playerData[index].isRookie == nil {
                        playerData[index].isRookie = false
                    }
                }
                return playerData
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        return [PlayerJSON]()
        
    }
    static func getArticleData()->[ArticleJSON]{
        //get url path to json file
        let pathString = Bundle.main.path(forResource: "articledata", ofType: "json")
        
        //check if pathstring is not will, otherwise...
        guard pathString != nil else{
            return [ArticleJSON]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            //create data object
            let data = try Data(contentsOf: url)
            //decode data with JSON decoder
            let decoder = JSONDecoder()
            do{
                var articleData = try decoder.decode([ArticleJSON].self, from: data)
                for index in 0..<articleData.count {
                    //add unique ids
                    articleData[index].id = UUID()
                }
                return articleData
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        return [ArticleJSON]()
        
    }
    
    
}
