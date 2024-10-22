//
//  Building.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/2/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Building: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var year_built: Int
    var description: String
    var image_url: String
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

}
