//
//  ContentView.swift
//  XavierMapApp
//
//  Created by Eric Alley on 9/24/24.
//

import SwiftUI
import MapKit
import SwiftData


// College Enum as in the original code
enum College: String, CaseIterable {
    case GeneralTour = "General Tour"
    case CollegeofArtsandSciences = "College of Arts and Sciences"
    case CollegeofNursing = "College of Nursing"
    case WilliamsCollegeofBusiness = "Williams College of Business"
    case CollegeofProfessionalSciences = "College of Professional Sciences"
}




// Loads building data from json file
class BuildingDataLoader: ObservableObject {
    @Published var buildingViewModels: [BuildingViewModel] = []
    
    init() {
        loadBuildings()
    }
    
    private func loadBuildings() {
        if let url = Bundle.main.url(forResource: "XavierBuildings", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let buildings = try JSONDecoder().decode([Building].self, from: data)
                buildingViewModels = buildings.map { BuildingViewModel(building: $0) }
            } catch {
                print("Error loading or decoding XavierBuildings.json: \(error)")
            }
        }
    }
}


struct MapView: View {
    @StateObject private var buildingDataLoader = BuildingDataLoader()
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.149843, longitude: -84.474057),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.002)
        )
    )
    
    @StateObject private var locationManager = LocationManager()
    @State private var selectedCollege: College = .GeneralTour
    @State private var selectedBuilding: BuildingViewModel? // track selected building
    @State private var showBuildingDetail = false // track navigation trigger
    
    let collegeToBuildings: [College: [String]] = [
        .GeneralTour: ["Schott Hall", "Our Lady Of Peace Chapel", "Edgecliff Hall", "Schmidt Hall", "Hinkle Hall", "McDonald Library", "Alter Hall","Albers Hall", "Logan Hall", "Lindner Family Physics Building", "Hailstones Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Cohen Center", "Flynn Hall", "Health United Building (HUB)", "Hoff Dining Commons", "Smith Hall", "Conaton Learning Commons"],
        .CollegeofArtsandSciences: ["Schott Hall", "Our Lady Of Peace Chapel", "Edgecliff Hall", "Schmidt Hall", "Hinkle Hall", "McDonald Library", "Alter Hall", "Albers Hall", "Logan Hall", "Lindner Family Physics Building", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Flynn Hall", "Hoff Dining Commons", "Conaton Learning Commons"],
        .WilliamsCollegeofBusiness: ["Schott Hall", "Our Lady Of Peace Chapel", "Schmidt Hall", "McDonald Library", "Alter Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Flynn Hall", "Hoff Dining Commons", "Smith Hall", "Conaton Learning Commons"],
        .CollegeofProfessionalSciences: ["Schott Hall", "Our Lady Of Peace Chapel", "Schmidt Hall", "McDonald Library", "Alter Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Cohen Center", "Flynn Hall", "Health United Building (HUB)", "Hoff Dining Commons", "Conaton Learning Commons"],
        .CollegeofNursing: ["Schott Hall", "Our Lady Of Peace Chapel", "Schmidt Hall", "McDonald Library", "Alter Hall", "Bellarmine Chapel", "Gallagher Student Center", "Brockman Hall", "Buenger Residence Hall", "Kuhlman Residence Hall", "Husman Residence Hall", "Cintas Center", "Cohen Center", "Flynn Hall", "Health United Building (HUB)", "Hoff Dining Commons", "Conaton Learning Commons"]
    ]
    
    var body: some View {

        

        VStack {
            Picker("Select College", selection: $selectedCollege) {
                ForEach(College.allCases, id: \.self) { college in
                    Text(college.rawValue).tag(college)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            NavigationStack {
                Map(position: $cameraPosition, interactionModes: .all) {
                    UserAnnotation()
                    
                    // Use BuildingViewModel with Map
                    // Loops through to populate map
                    ForEach(Array(filteredBuildingViewModels.enumerated()), id: \.element.id) { index, building in
                            Annotation(building.name, coordinate: building.locationCoordinates) {
                                VStack {
                                    // Display the number for each building based on its order
                                    Text("\(index + 1)") // Sequential number starting from 1
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Circle().fill(Color.blue))
                                }
                            }
                        }
                }
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.startUpdatingLocation()
                }
                .onReceive(locationManager.$userLocation) { newLocation in
                    if let newLocation = newLocation {
                        cameraPosition = .region(
                            MKCoordinateRegion(
                                center: newLocation,
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.002)
                            )
                        )
                    }
                }
                .mapControls {
                    MapUserLocationButton()
                    MapCompass()
                    MapScaleView()
                    MapPitchToggle()
                }
                .navigationDestination(isPresented: $showBuildingDetail) {
                    if let building = selectedBuilding {
                        BuildingsDetail(building: building.building)
                    }
                }
            }
        }
    }



    // helps determine what set of buildings to display
    private var filteredBuildingViewModels: [BuildingViewModel] {
        guard let buildingNames = collegeToBuildings[selectedCollege] else { return [] }
        return buildingDataLoader.buildingViewModels.filter { buildingNames.contains($0.name) }
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


