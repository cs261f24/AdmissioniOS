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
    
    
    
    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(buildings) { Building in
                    NavigationLink {
                        BuildingsDetail(building: Building)
                    } label: {
                        BuildingsRow(building: Building)
                    }
                }
            }
        }
        detail: {
            Text("Buildings")
        }
        
        
        
        
        
        
    }
}


#Preview {
    BuildingsList()
}
