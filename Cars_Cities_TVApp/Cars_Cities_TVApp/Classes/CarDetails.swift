//
//  CarDetails.swift
//  Cars_Cities_TVApp
//
//  Created by Xcode on 2020-12-11.
//  Copyright © 2020 Nishit Amin. All rights reserved.
//

import UIKit

class CarDetails: NSObject {

    let carImages = ["3.jpeg", "S.jpeg", "A4.jpeg"]
    
    let carNames = ["BMW", "Tesla", "Audi"]
    
    let cars = "https://aminnis.dev.fast.sheridanc.on.ca/mydata/Cars.php" as String
    
    var Make: String = ""
    var Model: String  = ""
    var Year: String = ""
    var Color: String = ""
    var Status: String = ""
    var Price: String = ""
    
    func getDataFromJson(selected: Int){
        if let url = NSURL(string: cars){
            if let data = NSData(contentsOf: url as URL){
                do{
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! AnyObject
                    
                    let newDict = parsed as? NSArray
                    let car = newDict?[selected] as? NSDictionary
                    
                    Make = "\(car!["Make"]!)"
                    Model = "\(car!["Model"]!)"
                    Year = "\(car!["Year"]!)"
                    Color = "\(car!["Color"]!)"
                    Status = "\(car!["Status"]!)"
                    Price = "\(car!["Price"]!)"
                    
                }catch let error as NSError{
                    Make = "A JSON parsing error has pccured"
                    Model = error.description
                }
            }
        }
    }
}
