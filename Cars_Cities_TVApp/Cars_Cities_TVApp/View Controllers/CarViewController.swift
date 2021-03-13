//
//  CarViewController.swift
//  Cars_Cities_TVApp
//
//  Created by Xcode on 2020-12-11.
//  Copyright © 2020 Nishit Amin. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let carData = CarDetails()
    @IBOutlet var collectionView1 : UICollectionView!
    let reuseIdentifier = "FeaturedCell"
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> Float {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.collectionView1){
            return carData.carImages.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.collectionView1){
            let cell : CarCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CarCollectionViewCell
            
            let imageFileName = carData.carImages[indexPath.row]
            cell.featuredImage.image = UIImage(named: imageFileName)
            cell.lblCar.text = carData.carNames[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        carData.getDataFromJson(selected: indexPath.row)
        let alertController = UIAlertController(title: "Car Information \n\n\(carData.Make)\n", message: "Model: \(carData.Model)\n Year - \(carData.Year)\n Color - \(carData.Color) \n Status - \(carData.Status) \n Price - \(carData.Price)", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
