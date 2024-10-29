//
//  ImageViewTwo.swift
//  AdmissioniOS
//
//  Created by Simon Benjamin on 10/24/24.
//

import SwiftUI

struct ImageViewTwo: View {

    var college: Colleges
    
    var body: some View {
        AsyncImage(url: URL(string: college.image_url)) { image in
            image.resizable()
            
        }
        placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    let colleges = ModelData().colleges
    ImageViewTwo(college: colleges[1])

}
