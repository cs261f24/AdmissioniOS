//
// BuildingsDetail.swift
//
// Created by Simon Benjamin on 10/8/24.
//
//
import SwiftUI
    
struct BuildingsDetail: View {
    @Environment(ModelData.self) var modelData
    var building: Building
    var buildingsIndex: Int {
        modelData.buildings.firstIndex(where: { $0.id == building.id })!
    }
    
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            
            ImageView(building: building)
                .frame(width: 450, height: 500)
                //.offset(y: -65)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(building.name)
                        .font(.title)
                        .bold()
                    FavoriteButton(isSet: $modelData.buildings[buildingsIndex].isFavorite)
                }
                
                Divider()
                
                Text("Information")
                    .font(.title2)
                Text("")
                Text(building.description)
                Spacer()
                Text("Year Built: \(building.year_built)")
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
    let modelData = ModelData()
    return BuildingsDetail(building: ModelData().buildings[0])
        .environment(modelData)
}

