//
// BuildingsDetail.swift
//
// Created by Simon Benjamin on 10/8/24.
//
//
import SwiftUI
    
struct BuildingsDetail: View {
    
    var building: Building
    
    var body: some View {

        
    NavigationSplitView {
            
            ImageView(building: building)
                .frame(width: 450, height: 500)
                .offset(y: -65)
            
            VStack(alignment: .leading) {
                Text(building.name)
                    .font(.title)
                
                Divider()
                
                Text("About \(building.name)")
                    .font(.title2)
                Text("")
                Text(building.description)
            }
            
            .padding()
            
    } detail: {
        Text("")
    }
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BuildingsDetail(building: buildings[1])
}

