//
//  DataModelView.swift
//  NBAFantasyGuide
//
//  Created by Aadi Ghai on 6/23/23.
//

import Foundation
class DataModel:ObservableObject{
    @Published var players = [Player]()
    @Published var myPlayers = [Player]()
    init(){
        //create an instance of data service and get the data
        self.players = DataService.getLocalData()
        
    }
}
