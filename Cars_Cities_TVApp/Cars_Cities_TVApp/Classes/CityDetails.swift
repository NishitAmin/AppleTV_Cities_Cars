//
//  CityDetails.swift
//  Cars_Cities_TVApp
//
//  Created by Xcode on 2020-12-11.
//  Copyright © 2020 Nishit Amin. All rights reserved.
//

import UIKit

class CityDetails: NSObject {
   
    let cities = ["toronto.jpeg", "montreal.jpeg", "vancouver.jpeg", "nyc.jpeg", "sanfran.jpeg"]
    
    let cityNames = ["Toronto","Montreal", "Vancouver", "New York City", "San Francisco"]
    
    let cityLatLong = "https://aminnis.dev.fast.sheridanc.on.ca/mydata/Cities.php" as String
    
    var Name : String = ""
    var Latitude : String = ""
    var Longitude : String = ""
    var Population : String = ""
    
    func getDataFromJson(selected: Int){
        if let url = NSURL(string: cityLatLong){
            if let data = NSData(contentsOf: url as URL){
                do{
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! AnyObject
                    
                    let newDict = parsed as? NSArray
                    let cityForecast = newDict![selected] as! NSDictionary
                    
                    Name = "\(cityForecast["Name"]!)"
                    Latitude = "\(cityForecast["Latitude"]!)"
                    Longitude = "\(cityForecast["Longitude"]!)"
                    Population = "\(cityForecast["Population"]!)"
                    
                }catch let error as NSError{
                    Name = "A JSON parsing error has pccured"
                    Latitude = error.description
                }
            }
        }
    }
}
