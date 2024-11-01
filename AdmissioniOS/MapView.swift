//
//  ContentView.swift
//  XavierMapApp
//
//  Created by Eric Alley on 9/24/24.
//

import SwiftUI
import MapKit
import SwiftData

enum College: String, CaseIterable {
    case GeneralTour = "General Tour"
    case CollegeofArtsandSciences = "College of Arts and Sciences"
    case CollegeofNursing = "College of Nursing"
    case WilliamsCollegeofBusiness = "Williams College of Business"
    case CollegeofProfessionalSciences = "College of Professional Sciences"
}

let collegeToBuildings: [College: [String]] = [
    .GeneralTour: ["Schott Hall", "Our Lady Of Peace Chapel", "Edgecliff Hall", "Schmidt Hall", "Hinkle Hall", "McDonald Library", "Alter Hall","Albers Hall", "Logan Hall", "Lindner Family Physics Building", "Hailstones Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Cohen Center", "Flynn Hall", "Health United Building (HUB)", "Hoff Dining Commons", "Smith Hall", "Conaton Learning Commons"],
    .CollegeofArtsandSciences: ["Schott Hall", "Our Lady Of Peace Chapel", "Edgecliff Hall", "Schmidt Hall", "Hinkle Hall", "McDonald Library", "Alter Hall", "Albers Hall", "Logan Hall", "Lindner Family Physics Building", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Flynn Hall", "Hoff Dining Commons", "Conaton Learning Commons"],
    .WilliamsCollegeofBusiness: ["Schott Hall", "Our Lady Of Peace Chapel", "Schmidt Hall", "McDonald Library", "Alter Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Flynn Hall", "Hoff Dining Commons", "Smith Hall", "Conaton Learning Commons"],
    .CollegeofProfessionalSciences: ["Schott Hall", "Our Lady Of Peace Chapel", "Schmidt Hall", "McDonald Library", "Alter Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Cohen Center", "Flynn Hall", "Health United Building (HUB)", "Hoff Dining Commons", "Conaton Learning Commons"],
    .CollegeofNursing: ["Schott Hall", "Our Lady Of Peace Chapel", "Schmidt Hall", "McDonald Library", "Alter Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Cohen Center", "Flynn Hall", "Health United Building (HUB)", "Hoff Dining Commons", "Conaton Learning Commons"]
]

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
    
    // State variable to hold the selected college
    @State private var selectedCollege: College = .GeneralTour
    
    var body: some View {
        ZStack{
            
            VStack {
                // College Picker
                
                Picker("Select College", selection: $selectedCollege) {
                    ForEach(College.allCases, id: \.self) { college in
                        Text(college.rawValue).tag(college)
                    }
                    
                }
                .pickerStyle(MenuPickerStyle())
                
                
                
                
                
                NavigationStack {
                    Map(position: $cameraPosition, interactionModes: .all) {
                        
                        // Display the user location annotation
                        UserAnnotation()
                        
                        // Add markers based on the selected college
                        if let buildings = collegeToBuildings[selectedCollege] {
                            if buildings.contains("Schott Hall") {
                                Marker("Schott Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14749516485998, longitude: -84.47589391133172))
                            }
                            if buildings.contains("Our Lady Of Peace Chapel") {
                                Marker("Our Lady Of Peace Chapel", coordinate: CLLocationCoordinate2D(latitude: 39.148996936066126, longitude: -84.47443868293045))
                            }
                            if buildings.contains("Edgecliff Hall") {
                                Marker("Edgecliff Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14782001454611, longitude: -84.47677308547028))
                            }
                            if buildings.contains("Schmidt Hall") {
                                Marker("Schmidt Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14802228864941, longitude: -84.47627570920967))
                            }
                            if buildings.contains("Hinkle Hall") {
                                Marker("Hinkle Hall", coordinate: CLLocationCoordinate2D(latitude: 39.148251659471256, longitude: -84.47591421825771))
                            }
                            if buildings.contains("McDonald Library") {
                                Marker("McDonald Library", coordinate: CLLocationCoordinate2D(latitude: 39.14789910771434, longitude: -84.47561297579773))
                            }
                            if buildings.contains("Alter Hall") {
                                Marker("Alter Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14826617831487, longitude: -84.47527371560804))
                            }
                            if buildings.contains("Albers Hall") {
                                Marker("Albers Hall", coordinate: CLLocationCoordinate2D(latitude: 39.148645500359414, longitude: -84.4755654839185))
                            }
                            if buildings.contains("Logan Hall") {
                                Marker("Logan Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14903355881236, longitude: -84.47524726130504))
                            }
                            if buildings.contains("Lindner Family Physics Building") {
                                Marker("Lindner Family Physics Building", coordinate: CLLocationCoordinate2D(latitude: 39.14921890205347, longitude: -84.47490516795914))
                            }
                            if buildings.contains("Hailstones Hall") {
                                Marker("Hailstones Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14831035208691, longitude: -84.4744646641785))
                            }
                            if buildings.contains("Bellarmine Chapel") {
                                Marker("Bellarmine Chapel", coordinate: CLLocationCoordinate2D(latitude: 39.148986314379755, longitude: -84.47447872280914))
                            }
                            if buildings.contains("Gallagher Student Center") {
                                Marker("Gallagher Student Center", coordinate: CLLocationCoordinate2D(latitude: 39.14966397527366, longitude: -84.47441713895871))
                            }
                            if buildings.contains("Brockman Hall") {
                                Marker("Brockman Hall", coordinate: CLLocationCoordinate2D(latitude: 39.15022144050888, longitude: -84.47415278782245))
                            }
                            if buildings.contains("Buenger Residence Hall") {
                                Marker("Buenger Residence Hall", coordinate: CLLocationCoordinate2D(latitude: 39.1510055340199, longitude: -84.47338280393828))
                            }
                            if buildings.contains("Kuhlman Residence Hall") {
                                Marker("Kuhlman Residence Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14982776388571, longitude: -84.47329449716214))
                            }
                            if buildings.contains("Husman Residence Hall") {
                                Marker("Husman Residence Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14932315951523, longitude: -84.4731626595861))
                            }
                            if buildings.contains("Cintas Center") {
                                Marker("Cintas Center", coordinate: CLLocationCoordinate2D(latitude: 39.150148, longitude: -84.471881))
                            }
                            if buildings.contains("Cohen Center") {
                                Marker("Cohen Center", coordinate: CLLocationCoordinate2D(latitude: 39.15101766867888, longitude: -84.46965234617623))
                            }
                            if buildings.contains("Flynn Hall") {
                                Marker("Flynn Hall", coordinate: CLLocationCoordinate2D(latitude: 39.1489370277305, longitude: -84.4714734105751))
                            }
                            if buildings.contains("Health United Building (HUB)") {
                                Marker("Health United Building (HUB)", coordinate: CLLocationCoordinate2D(latitude: 39.148355047071924, longitude: -84.46995063573026))
                            }
                            if buildings.contains("Hoff Dining Commons") {
                                Marker("Hoff Dining Commons", coordinate: CLLocationCoordinate2D(latitude: 39.14832012299147, longitude: -84.47321422859794))
                            }
                            if buildings.contains("Smith Hall") {
                                Marker("Smith Hall", coordinate: CLLocationCoordinate2D(latitude: 39.14751604899918, longitude: -84.47393246761132))
                            }
                            if buildings.contains("Conaton Learning Commons") {
                                Marker("Conaton Learning Commons", coordinate: CLLocationCoordinate2D(latitude: 39.147754692022325, longitude: -84.47509058236443))
                            }
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


