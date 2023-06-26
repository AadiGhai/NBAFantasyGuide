//
//  DataModelView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import Foundation
class DataModel:ObservableObject {
    @Published var players = [Player]()
    
    init(){
        getLocalData()
    }
    
    func getLocalData() {
        let jsonUrl = Bundle.main.url(forResource: "playerdata", withExtension: "json")
        
        do{
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            let players = try jsonDecoder.decode([Player].self, from: jsonData)
            self.players = players
            }
            catch{
                print("Couldn't parse local data")
            }
    
    }
} 

