//
//  DataStore.swift
//  ParkStash Coding Challenge
//
//  Created by Shreyas Zagade on 3/22/18.
//  Copyright © 2018 Shreyas Zagade. All rights reserved.
//

import Foundation
import Locksmith

class DataStore{
    
    static let USER_ACCOUNT = "ParkStash"
    
    static func saveData(lat : Double, long : Double) -> Bool{
        do{
            try Locksmith.deleteDataForUserAccount(userAccount: USER_ACCOUNT)
        }catch{
            print("Data Does not exists")
        }
        
        do{
            try Locksmith.saveData(data: ["latitude": lat, "longitude" : long], forUserAccount: USER_ACCOUNT)
            return true
        }catch{
            print("Not Able to save")
            return false
        }
        
    }
    
    static func retriveDataOrDefault() -> (Double,Double) {
        let latitude : Double = 35.769275499999999
        let longitude : Double = -78.676424999999995
        
        if let dictionary = Locksmith.loadDataForUserAccount(userAccount: USER_ACCOUNT){
            if let lat = dictionary["latitude"] as? Double{
                let long = dictionary["longitude"] as! Double
                return (lat,long)
            }
        }
        return (latitude,longitude)
    }
    
}
