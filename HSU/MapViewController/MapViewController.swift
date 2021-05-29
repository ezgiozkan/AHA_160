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
    
    var locationManager : CLLocationManager!
    //let searchRadius: CLLocationDistance = 2000
   
    
   
    
    
    
    let annotationLocations = [
        
        ["title":"Dobido Veteriner KLiniği","latitude":39.895177 , "longitude":32.838194],
        ["title":"Arda Veteriner Klinik","latitude": 39.894749, "longitude":32.841074],
        ["title":"Korusev Veteriner Klinik","latitude":  39.893615, "longitude":32.841476]
      
    ]
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getLocation()
        configureNavBar()
 
        backView.layer.cornerRadius = 38
        //configureBackView()
        createAnnotations(locations: annotationLocations)
       
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
    
   

    
    func configureBackView(){
       
        self.backView.backViewShadow(cornerRadius: 8)
        
       
    }
    
    func configureNavBar() {
        
        self.navigationController?.navigationBar.topItem?.title = "Harita"
    }
    
    
}

class Location : NSObject, MKAnnotation{
    
    var coordinate : CLLocationCoordinate2D
  
    init( vcoordinate : CLLocationCoordinate2D){
        coordinate = vcoordinate
       
    }
}




