//
//  BuildingsList.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/7/24.
//

import SwiftUI

struct BuildingsList: View {
    var body: some View {
        
        NavigationSplitView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredBuildings) { Building in
                    NavigationLink {
                        BuildingsDetail(building: Building)
                            .offset(y: -65)
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
}
