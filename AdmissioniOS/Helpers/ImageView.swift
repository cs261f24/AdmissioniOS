//
//  ImageView.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/8/24.
//

import SwiftUI

struct ImageView: View {
    
    var building: Building
    
    var body: some View {
        AsyncImage(url: URL(string: building.image_url)) { image in
            image.resizable()
            
        }
        placeholder: {
            ProgressView()
        }
        
    }
}

#Preview {
    let buildings = ModelData().buildings
    ImageView(building: buildings[1])
}
