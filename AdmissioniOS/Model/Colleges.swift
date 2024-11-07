//
//  Colleges.swift
//  AdmissioniOS
//
//  Created by Simon Benjamin on 10/18/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Colleges: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var description: String
    var buildings: String
    var image_url: String
    var isFavorite: Bool
    var logo: String
}
