//
//  ContentView.swift
//  XavierMapApp
//
//  Created by Eric Alley on 9/24/24.
//

import SwiftUI
import MapKit
import SwiftData







// Loads building data from json file
class BuildingDataLoader: ObservableObject {
    @Published var buildingViewModels: [BuildingViewModel] = []
    @Published var colleges: [String] = []
    
    init() {
        loadBuildings()
    }
    
    private func loadBuildings() {
            if let url = Bundle.main.url(forResource: "XavierBuildings", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let buildings = try JSONDecoder().decode([Building].self, from: data)
                    buildingViewModels = buildings.map { BuildingViewModel(building: $0) }
                    // Dynamically extract unique colleges
                    colleges = Array(Set(buildings.flatMap { $0.colleges })).sorted()
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
    @State private var selectedCollege: String = "General Tour"
    @State private var selectedBuilding: BuildingViewModel? // track selected building
    @State private var showBuildingDetail = false // track navigation trigger
        
   
    
    let mapBoundaryRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.149843, longitude: -84.474057),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    
    var body: some View {

        

        VStack {
                    Picker("Select College", selection: $selectedCollege) {
                        ForEach(buildingDataLoader.colleges, id: \.self) { college in
                            Text(college).tag(college)
                        }
                    }
            .pickerStyle(MenuPickerStyle())
            
            NavigationStack {
                
                let cameraBounds = MapCameraBounds(
                                    centerCoordinateBounds: mapBoundaryRegion,
                                    minimumDistance: 500, // Minimum zoom distance
                                    maximumDistance: 5000 // Maximum zoom distance
                                )
                
                Map(position: $cameraPosition, bounds: cameraBounds, interactionModes: .all) {
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
                                .onTapGesture {
                                    selectedBuilding = building
                                    showBuildingDetail = true // triggers navigation
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
            buildingDataLoader.buildingViewModels.filter { $0.colleges.contains(selectedCollege) }
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
