//
//  BuildingsRow.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/2/24.
//

import SwiftUI

struct BuildingsRow: View {
    var building: Building
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: building.image_url)) { image in
                image.resizable()
                    .cornerRadius(4.0)
            }
            placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .padding(.trailing, 10)
            Text(building.name)
            
            Spacer()
            
        }
    }
}

#Preview {
    let buildings = ModelData().buildings
    return Group {
        BuildingsRow(building: buildings[0])
        BuildingsRow(building: buildings[1])
    }
    
}

