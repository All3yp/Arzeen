//
//  Artwork.swift
//  Arzeen
//
//  Created by Brena Amorim on 01/10/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
    
}
