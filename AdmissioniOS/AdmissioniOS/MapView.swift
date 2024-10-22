//
//  ContentView.swift
//  XavierMapApp
//
//  Created by Eric Alley on 9/24/24.
//

import SwiftUI
import MapKit
import SwiftData 

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.149843, longitude: -84.474057), // Xavier University coordinates
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.002) // Zoom level
        )
    )
    
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        Map(position: $cameraPosition, interactionModes: .all) {
            // Display the user location annotation
            UserAnnotation()
        }
        
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        .onReceive(locationManager.$userLocation) { newLocation in
            if let newLocation = newLocation {
                // Update the camera to the user's current location
                cameraPosition = .region(
                    MKCoordinateRegion(
                        center: newLocation,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.002)
                    )
                )
            }
        }
        .mapControls {
            MapUserLocationButton() //Button to center on user
            MapCompass()
            MapScaleView() //Pinch to zoom displays scale
            MapPitchToggle() //Toggle 2D/3D view
            
        }
    }
}

// Simple Location Manager class to handle location services
class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location.coordinate
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}









