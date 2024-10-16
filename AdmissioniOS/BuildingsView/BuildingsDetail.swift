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

        
        ScrollView {
            
            ImageView(building: building)
                .frame(width: 450, height: 500)
                //.offset(y: -65)
            
            VStack(alignment: .leading) {
                Text(building.name)
                    .font(.title)
                
                Divider()
                
                Text("Information")
                    .font(.title2)
                Text("")
                Text(building.description)
            }
            .navigationTitle("Landmarks")
            .padding()
            .frame(width: 410)
            
        }
        .navigationTitle(building.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BuildingsDetail(building: buildings[1])
}

