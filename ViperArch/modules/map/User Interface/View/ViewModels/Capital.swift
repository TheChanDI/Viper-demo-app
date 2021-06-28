//
//  Capital.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var info: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, info: String) {
        self.coordinate = coordinate
        self.title = title
        self.info = info
    }
    
}
