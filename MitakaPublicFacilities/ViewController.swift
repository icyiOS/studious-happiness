//
//  ViewController.swift
//  MitakaPublicFacilities
//
//  Created by 李超逸 on 2018/03/30.
//  Copyright © 2018 李超逸. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 35.688835,
                                     longitude: 139.562163)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        centerMapOnLocation(location: initialLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

