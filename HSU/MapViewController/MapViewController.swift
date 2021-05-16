//
//  MapViewController.swift
//  HSU
//
//  Created by ezgi on 16.05.2021.
//

import UIKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {

    //IBoutles
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var backView: UIView!
    
    var locationManager : CLLocationManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getLocation()
      
        backView.layer.cornerRadius = 38
        //configureBackView()
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
        
        let kullaniciAlani:CLLocation = locations[0] as CLLocation
        locationManager.stopUpdatingLocation()
        
        let Alan = CLLocationCoordinate2D(latitude: kullaniciAlani.coordinate.latitude, longitude: kullaniciAlani.coordinate.longitude)
        let aralik = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: Alan, span: aralik)
              myMap.setRegion(bolge, animated: true)
    }
    
    
    func configureBackView(){
        backView.roundedButton()
       
    }
}

class Location : NSObject, MKAnnotation{
    
    var coordinate : CLLocationCoordinate2D
  
    init( vcoordinate : CLLocationCoordinate2D){
        coordinate = vcoordinate
       
    }
}

extension UIView{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight],
            cornerRadii: CGSize(width: 38, height: 38))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}


