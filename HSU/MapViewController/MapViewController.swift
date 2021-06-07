//
//  MapViewController.swift
//  HSU
//
//  Created by ezgi on 16.05.2021.
//

import UIKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{

    //IBoutles
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var clinicImage: UIImageView!
    @IBOutlet weak var clinicTitle: UILabel!
    @IBOutlet weak var clinicAddress: UILabel!
    @IBOutlet weak var clinicName: UILabel!
  
    @IBOutlet weak var backViewFront: UIView!
    
    @IBOutlet weak var txtInfo: UILabel!
    var locationManager : CLLocationManager!
    
    
    
    let annotationLocations = [
        
        ["title":"Dobido Veteriner Kliniği","latitude":39.895177 , "longitude":32.838194],
        ["title":"Arda Veteriner Kliniği","latitude": 39.894749, "longitude":32.841074],
        ["title":"Korusev Veteriner Kliniği","latitude":  39.893615, "longitude":32.841476]
      
    ]
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getLocation()
        configureNavBar()
        backViewFrontConfiguration()
        backView.layer.cornerRadius = 38
        //configureBackView()
        createAnnotations(locations: annotationLocations)
        self.view.bringSubviewToFront(backView)
        myMap.delegate = self
    }
    
    
    

    func getLocation(){
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
      
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager.startUpdatingLocation()
            myMap.showsUserLocation = true
        }
    }
 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){

        //myMap.addAnnotation(Location(vcoordinate: locations[0].coordinate))
        
        let userArea:CLLocation = locations[0] as CLLocation
        locationManager.stopUpdatingLocation()
        
        let Area = CLLocationCoordinate2D(latitude: userArea.coordinate.latitude, longitude: userArea.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let area = MKCoordinateRegion(center: Area, span: span)
              myMap.setRegion(area, animated: true)
    }
    
    func createAnnotations(locations: [[String: Any]])
    {
        
        for location in locations{
           let annotations = MKPointAnnotation()
           annotations.title = location["title"] as? String
         
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude:  location["longitude"] as! CLLocationDegrees)
            myMap.addAnnotation(annotations)
            
        }
       
        
    }
    
    func mapView(_ mapView: MKMapView,didSelect view: MKAnnotationView) {
       let ann = view.annotation as! MKPointAnnotation
        
      //Logoların değişmesi gerek
        
        if ann.title == nil {
            clinicTitle.text = ""
        }
        else if ann.title == "Dobido Veteriner Kliniği"{
            clinicTitle.text = "Dobido Veteriner KLiniği"
            clinicImage.image = UIImage(named: "bear")
            clinicAddress.text = "Harbiye Mahallesi, Dikili Sk. No:17, 06460 Çankaya/Ankara"
            txtInfo.isHidden = true
        }
        else if ann.title == "Arda Veteriner Kliniği"{
            clinicTitle.text = "Arda Veteriner KLiniği"
            clinicImage.image = UIImage(named: "bear")
            clinicAddress.text = "Dikmen Cd. 120/1, 06450 Çankaya/Ankara"
            txtInfo.isHidden = true
        }
        else if ann.title == "Korusev Veteriner Kliniği"{
            clinicTitle.text = "Korusev Veteriner Kliniği"
            clinicImage.image = UIImage(named: "bear")
            clinicAddress.text = "Mahir Turan Sk. No:3, 06690 Çankaya/Ankara"
            txtInfo.isHidden = true
        }
    }
   
   
    func configureBackView(){
       
    self.backView.backViewShadow(cornerRadius: 100)
        
    }
    
    func configureNavBar() {
        
        self.navigationController?.navigationBar.topItem?.title = "Harita"
        
    }
    func backViewFrontConfiguration(){
    
   
    backView.layer.masksToBounds = true
    backView.layer.cornerRadius = 8
    backView.layer.masksToBounds = false
    backView.layer.shadowRadius = 8.0
    backView.layer.shadowOpacity = 0.20
    backView.layer.shadowColor = UIColor.black.cgColor
    backView.layer.shadowOffset = CGSize(width: 0, height: 5)
}

}

class Location : NSObject, MKAnnotation{
    
    var coordinate : CLLocationCoordinate2D
  
    init( vcoordinate : CLLocationCoordinate2D){
        coordinate = vcoordinate
       
    }
}




