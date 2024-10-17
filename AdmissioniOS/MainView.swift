//
//  MainView.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 9/27/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem() {
                    Image(systemName: "map")
                    Text("Map")
                }
            
            RoutesView()
                .tabItem() {
                    Image(systemName: "point.bottomleft.forward.to.point.topright.scurvepath")
                    Text("Routes")
                }
            
            BuildingsList()
                .tabItem() {
                    Image(systemName: "building.columns.fill")
                    Text("Buildings")
                    
                }
            
            MoreView()
                .tabItem() {
                    Image(systemName: "ellipsis.circle")
                    Text("More")
                    
                }
            
            
        }
        
        
        
    }
}

#Preview {
    MainView()
        .environment(ModelData())
}
