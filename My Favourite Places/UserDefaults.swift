//
//  UserDefaults.swift
//  My Favourite Places
//
//  Created by Joao Garrido on 22/11/2021.
//

import Foundation

//custom class to make it easier to handle user defaults
class Defaults{
    
    public func get() -> [[String : String]] {
        UserDefaults
        if let data = UserDefaults.standard.data(forKey: "results") {
            return try! PropertyListDecoder().decode([Results].self, from: data)
        }
        return []
    }
    
    //add result to user memory
    //in case there are 10 already remove the first one
    public func addLatestResult(result : Results) {
        var resultsArray : [Results] = getLastResults()
        if(resultsArray.count == 10){
            resultsArray.removeFirst()
        }
        resultsArray.append(result)
        if let data = try? PropertyListEncoder().encode(resultsArray) {
            UserDefaults.standard.set(data, forKey: "results")
        }
    }
    
    //add win to user memory
    public func addWin(winner : String){
        var winArray = getWins()
        winArray.append(winner)
        UserDefaults.standard.set(winArray, forKey: "wins")
    }
    
    //get user memory of wins
    public func getWins() -> Array<String> {
        return UserDefaults.standard.stringArray(forKey: "wins") ?? []
    }
}
