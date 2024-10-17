//
//  Building.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/2/24.
//
/*
 Building.swift decodes the XavierBuildings.json file and creates a Building structure out of the information
 */


import Foundation
import SwiftUI
import CoreLocation

struct Building: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var year_built: String
    var description: String
    var image_url: String
    var isFavorite: Bool
    
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
