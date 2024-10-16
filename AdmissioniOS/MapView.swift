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
    // state to control navigation
    @State private var showDetail = false

    var body: some View {
        // wrap Map in a navigation stack to support navigation between views
        NavigationStack {
            Map(position: $cameraPosition, interactionModes: .all) {
                // Display the user location annotation
                UserAnnotation()
                Marker("Schott Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14749516485998, longitude: -84.47589391133172))
                            Marker("Our Lady Of Peace Chapel", coordinate: CLLocationCoordinate2D(latitude: 39.148996936066126, longitude: -84.47443868293045))
                            Marker("Edgecliff Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14782001454611, longitude: -84.47677308547028))
                                Marker("Schmidt Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14802228864941, longitude: -84.47627570920967))
                                Marker("Hinkle Hall", coordinate: CLLocationCoordinate2D(latitude: 39.148251659471256, longitude: -84.47591421825771))
                                Marker("McDonald Library", coordinate: CLLocationCoordinate2D(latitude: 39.14789910771434, longitude: -84.47561297579773))
                                Marker("Alter Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14826617831487, longitude: -84.47527371560804))
                                Marker("Albers Hall", coordinate: CLLocationCoordinate2D(latitude: 39.148645500359414, longitude: -84.4755654839185))
                                Marker("Logan Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14903355881236, longitude: -84.47524726130504))
                                Marker("Lindner Family Physics Building", coordinate: CLLocationCoordinate2D(latitude: 39.14921890205347, longitude: -84.47490516795914))
                                Marker("Hailstones Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14831035208691, longitude: -84.4744646641785))
                                Marker("Bellarmine Chapel", coordinate: CLLocationCoordinate2D(latitude: 39.148986314379755, longitude: -84.47447872280914))
                                Marker("Gallagher Student Center", coordinate: CLLocationCoordinate2D(latitude: 39.14966397527366, longitude: -84.47441713895871))
                                Marker("Brockman Hall", coordinate: CLLocationCoordinate2D(latitude: 39.15022144050888, longitude: -84.47415278782245))
                                Marker("Buenger Residence Hall", coordinate: CLLocationCoordinate2D(latitude: 39.1510055340199, longitude: -84.47338280393828))
                                Marker("Kuhlman Residence Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14982776388571, longitude: -84.47329449716214))
                                Marker("Husman Residence Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14932315951523, longitude: -84.4731626595861))
                                Marker("Cintas Center", coordinate: CLLocationCoordinate2D(latitude: 39.14842472902665, longitude: -84.47324120705952))
                                Marker("Cohen Center", coordinate: CLLocationCoordinate2D(latitude: 39.15101766867888, longitude: -84.46965234617623))
                                Marker("Flynn Hall", coordinate: CLLocationCoordinate2D(latitude: 39.1489370277305, longitude: -84.4714734105751))
                                Marker("Health United Building (HUB)", coordinate: CLLocationCoordinate2D(latitude: 39.148355047071924, longitude: -84.46995063573026))
                                Marker("Hoff Dining Commons", coordinate: CLLocationCoordinate2D(latitude: 39.14832012299147, longitude: -84.47321422859794))
                                Marker("Smith Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14751604899918, longitude: -84.47393246761132))
                                Marker("Conaton Learning Commons", coordinate: CLLocationCoordinate2D(latitude: 39.147754692022325, longitude: -84.47509058236443))

               // Wrap markers in naviagtion link for direct naviagtion
                    // is currently giving an error saying that buidlingsdetail
                    // isn't in scope. This is because BuildingsView hasn't been
                    // defined yet
               // NavigationLink(destination: BuildingsDetail()) {
                 //   Marker("Schott Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14749516485998, longitude: -84.47589391133172))
                //}
            }
           
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


