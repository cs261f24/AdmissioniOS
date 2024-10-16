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
