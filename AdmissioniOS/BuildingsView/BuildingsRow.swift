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
    
        BuildingsRow(building: buildings[0])
        BuildingsRow(building: buildings[1])
    
    
}
