//
//  ViewController.swift
//  Where Am I
//
//  Created by Jorge Gallardo on 8/6/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var nearestAddressLabel: UILabel!
    var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // we don't need background updating
        locationManager.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        let userLocation: CLLocation = locations[0] as CLLocation
        self.latLabel.text = "\(userLocation.coordinate.latitude)" // to convert to string
        self.longLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarkData, error) -> Void in
            if error != nil {
                print(error)
            } else {
                let placemarks = placemarkData as [CLPlacemark]!
                let loc: CLPlacemark = placemarks[0]
                
                var subThoroughfare: String = ""
                var thoroughfare: String = ""
                var subLocality: String = ""
                var locality: String = ""
                var postalCode: String = ""
                var country: String = ""
                var administrativeArea: String = ""
                
                if loc.subThoroughfare != nil {
                    subThoroughfare = loc.subThoroughfare!
                }
                if loc.thoroughfare != nil {
                    thoroughfare = loc.thoroughfare!
                }
                if loc.subLocality != nil {
                    subLocality = loc.subLocality!
                }
                if loc.locality != nil {
                    locality = loc.locality!
                }
                if loc.postalCode != nil {
                    postalCode = loc.postalCode!
                }
                if loc.country != nil {
                    country = loc.country!
                }
                if loc.administrativeArea != nil {
                    administrativeArea = loc.administrativeArea!
                }
                
                self.nearestAddressLabel.text = "\(subThoroughfare) " + "\(thoroughfare)" + "\(subLocality) " + "\n" + "\(locality) " + "\(administrativeArea) " + "\(postalCode)" + "\n" + "\(country)"
            }
        }
    }

//        let userLocation: CLLocation = locations[0] as CLLocation // cast as
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let latDelta: CLLocationDegrees = 0.01 //difference in latitude from one side of the screen towards the other
//        let longDelta: CLLocationDegrees = 0.01
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let region: MKCoordinateRegion =  MKCoordinateRegionMake(location, span)
//        map.setRegion(region, animated: true)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

