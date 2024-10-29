//
//  RoutesDetail.swift
//  AdmissioniOS
//
//  Created by Simon Benjamin on 10/22/24.
//

import SwiftUI

struct RoutesDetail: View {
    @Environment(ModelData.self) var modelData
    var college: Colleges
    var collegesIndex: Int {
        modelData.colleges.firstIndex(where: { $0.id == college.id })!
    }
    
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                FavoriteButton(isSet: $modelData.colleges[collegesIndex].isFavorite)
                    .position(x: 365)
                
                HStack {
                    
                    Text(college.name)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                
                
                Divider()
                
                Text("Information")
                    .font(.title2)
                Text("")
                Spacer()
                Text(college.description)
                Spacer(minLength: 30)
                Text("Buildings: \(college.buildings)")
                
                
                
            }
            .padding()
            .frame(width: 410)
            ImageViewTwo(college: college)
                .frame(width: 380, height: 400)
                .cornerRadius(10.0)
        }
        .offset(y: 50)
        .navigationTitle(college.name)
        .navigationBarTitleDisplayMode(.inline)
            
    }
}

#Preview {
    let modelData = ModelData()
    RoutesDetail(college: ModelData().colleges[1])
        .environment(modelData)
}
