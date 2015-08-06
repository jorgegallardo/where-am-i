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
        var userLocation: CLLocation = locations[0] as CLLocation
        self.latLabel.text = "\(userLocation.coordinate.latitude)" // to convert to string
        self.longLabel.text = "\(userLocation.coordinate.longitude)"
        
//        let userLocation: CLLocation = locations[0] as CLLocation // cast as
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let latDelta: CLLocationDegrees = 0.01 //difference in latitude from one side of the screen towards the other
//        let longDelta: CLLocationDegrees = 0.01
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let region: MKCoordinateRegion =  MKCoordinateRegionMake(location, span)
//        map.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

