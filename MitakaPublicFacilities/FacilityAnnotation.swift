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
    
    let cat3: String
    
    init(title: String,
         subtitle: String,
         coordinate: CLLocationCoordinate2D,
         cat3: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.cat3 = cat3
        
        super.init()
    }
}

class FacilityAnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        didSet {
            if let facilityAnnotation = annotation as? FacilityAnnotation {
                if facilityAnnotation.cat3 == "駅" {
                    markerTintColor = UIColor(rgb: 0x03A9F4)
                    glyphImage = #imageLiteral(resourceName: "station")
                }
            }
        }
    }
}
