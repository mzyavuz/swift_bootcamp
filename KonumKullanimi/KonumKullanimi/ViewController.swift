//
//  ViewController.swift
//  KonumKullanimi
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    
    var locationManager = CLLocationManager()

    @IBOutlet weak var harita: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        locationManager.delegate = self
        
        
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count - 1]
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        let hiz = sonKonum.speed
        
        labelEnlem.text = "E: \(enlem)"
        labelBoylam.text = "B: \(boylam)"
        labelHiz.text = "H: \(hiz)"
        
    
        //41.1622163,28.9152662
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let bolge = MKCoordinateRegion(center: konum, span: zoom)
        harita.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "Kemerburgaz"
        pin.subtitle = "\(enlem) - \(boylam)"
        harita.addAnnotation(pin)
        
        harita.showsUserLocation = true
    }
}
