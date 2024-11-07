//
//  RoutesRow.swift
//  AdmissioniOS
//
//  Created by Simon Benjamin on 10/18/24.
//

import SwiftUI

struct RoutesRow: View {
    var college: Colleges
    
    var body: some View {
        HStack {
            Image(systemName: college.logo)
                .frame(width: 100, height: 100)
                //.padding(.trailing, 10)
            Text(college.name)
                .bold()
            
            Spacer()
        }
    }
}

#Preview {
    let colleges = ModelData().colleges
    RoutesRow(college: colleges[0])
    RoutesRow(college: colleges[1])
    RoutesRow(college: colleges[2])
}
