//
//  BuildingViewModel.swift
//  AdmissioniOS
//
//  Created by Evan Gunnulfsen on 10/25/24.
//

// used to wrap a Building instance to make getting building info more straightforward  and easier to use in MapView


import Foundation
import CoreLocation

struct BuildingViewModel: Identifiable {
    private let building: Building
    
    var id: Int { building.id }
    var name: String { building.name }
    var yearBuilt: String { building.year_built }
    var description: String { building.description }
    var imageURL: String { building.image_url }
    var locationCoordinates: CLLocationCoordinate2D { building.locationCoordinate }
    
    init(building: Building) {
        self.building = building
    }
    
}


