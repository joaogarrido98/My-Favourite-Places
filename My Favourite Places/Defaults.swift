//
//  Defaults.swift
//  My Favourite Places
//
//  Created by Ilkin Samedzade on 22/11/2021.
//

//
//  UserDefaults.swift
//  My Favourite Places
//
//  Created by Joao Garrido on 22/11/2021.
//

import Foundation

//custom class to make it easier to handle user defaults
class Defaults{
    public func getLocations() -> [Locations] {
        if let data = UserDefaults.standard.data(forKey: "locations") {
            return try! PropertyListDecoder().decode([Locations].self, from: data)
        }
        return []
    }
    
    //add location to user memory
    public func addLocation(location : Locations) {
        var locationsArray : [Locations] = getLocations()
        locationsArray.append(location)
        if let data = try? PropertyListEncoder().encode(locationsArray) {
            UserDefaults.standard.set(data, forKey: "locations")
        }
    }
    
    public func deleteLocation(index : Int){
        var locationsArray : [Locations] = getLocations()
        locationsArray.remove(at: index)
        if let data = try? PropertyListEncoder().encode(locationsArray) {
            UserDefaults.standard.set(data, forKey: "locations")
        }
    }
}
