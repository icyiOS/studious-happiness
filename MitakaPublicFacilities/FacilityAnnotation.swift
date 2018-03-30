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
    
    init(title: String,
         subtitle: String,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
}
