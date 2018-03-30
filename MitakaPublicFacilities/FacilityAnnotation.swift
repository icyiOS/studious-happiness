//
//  FacilityAnnotation.swift
//  MitakaPublicFacilities
//
//  Created by 李超逸 on 2018/03/30.
//  Copyright © 2018 李超逸. All rights reserved.
//

import MapKit

class FacilityAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    let addr: String
    let cat3: String
    
    init(title: String,
         subtitle: String,
         coordinate: CLLocationCoordinate2D,
         addr: String,
         cat3: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.addr = addr
        self.cat3 = cat3
        
        super.init()
    }
}

class FacilityAnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            if let facilityAnnotation = newValue as? FacilityAnnotation {
                canShowCallout = true
                let addressLabel = UILabel()
                addressLabel.numberOfLines = 0
                addressLabel.font = addressLabel.font.withSize(12)
                addressLabel.text = facilityAnnotation.addr
                detailCalloutAccessoryView = addressLabel
                
                if facilityAnnotation.cat3 == "駅" {
                    markerTintColor = UIColor(rgb: 0x03A9F4)
                    glyphImage = #imageLiteral(resourceName: "station")
                }
            }
        }
    }
}
