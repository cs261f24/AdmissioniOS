//
//  BuildingsList.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/7/24.
//

import SwiftUI

/*
 Creates a list of all the buildings by using a ForEach loop that iterates through each the list of buildings and creates a BuildingsRow view for each and adds that view to the list
 */
struct BuildingsList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredBuildings: [Building] {
        modelData.buildings.filter { building in
                (!showFavoritesOnly || building.isFavorite)
            }
        }
    
    var body: some View {
        
        NavigationSplitView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredBuildings) { Building in
                    NavigationLink {
                        BuildingsDetail(building: Building)
                    }
                    label: {
                        BuildingsRow(building: Building)
                    }
                }
            }
            .animation(.default, value: filteredBuildings)
            .navigationTitle("Buildings")
        } detail: {
            Text("Buildings")
        }
        
    }
}


#Preview {
    BuildingsList()
        .environment(ModelData())
}
