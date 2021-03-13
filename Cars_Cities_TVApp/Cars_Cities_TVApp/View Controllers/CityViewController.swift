//
//  CityViewController.swift
//  Cars_Cities_TVApp
//
//  Created by Xcode on 2020-12-11.
//  Copyright © 2020 Nishit Amin. All rights reserved.
//

import UIKit
import MapKit

class CityViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var myMapView : MKMapView!
    @IBOutlet var imgCity : UIImageView!
    @IBOutlet var lblCity : UILabel!
    @IBOutlet var lblPopulation : UILabel!
    let cityData = CityDetails()
    let regionRadius : CLLocationDistance = 1000
    let dropPin = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateCity(select: 0)
    }

    func updateCity(select : Int){
        
        lblCity.text = cityData.cityNames[select]
        cityData.getDataFromJson(selected: select)
        let cityName = cityData.cityNames[select]
        
        lblPopulation.text = "Total Population: \(cityData.Population) million"
        
        let lat = Double(cityData.Latitude)!
        let long = Double(cityData.Longitude)!
        let initialLocation = CLLocation(latitude: lat, longitude: long)
        
        centerMapOnLocation(location: initialLocation)
        dropPin.coordinate = initialLocation.coordinate
        dropPin.title = "\(cityName)"
        self.myMapView.addAnnotation(dropPin)
        self.myMapView.selectAnnotation(dropPin, animated: true)
        
    }
    
    func centerMapOnLocation(location : CLLocation) {
        let coordinateRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        myMapView.setRegion(coordinateRegion, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
