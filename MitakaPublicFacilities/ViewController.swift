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
    let annotationIdentifier = "annotationIdentifier"
    
    let initialLocation = CLLocation(latitude: 35.70247739,
                                     longitude: 139.58017613)
    
    var annotations: [FacilityAnnotation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        centerMapOnLocation(location: initialLocation)
        
        mapView.register(FacilityAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: annotationIdentifier)
        
        annotations = loadDataFromFile().map({ facility in
            return FacilityAnnotation(title: facility.name,
                                      subtitle: facility.info,
                                      coordinate: CLLocationCoordinate2D(latitude: Double(facility.lng)!,
                                                                         longitude: Double(facility.lat)!),
                                      cat3: facility.cat3)
        })
        
        mapView.addAnnotations(annotations)
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
    
    func loadDataFromFile() -> [Facility] {
        let decoder = JSONDecoder()
        do {
            let url = Bundle.main.url(forResource: "facilities", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let result = try decoder.decode([Facility].self, from: data)
            return result
        } catch {
            return []
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier,
                                                                   for: annotation)
        return annotationView
    }
}
