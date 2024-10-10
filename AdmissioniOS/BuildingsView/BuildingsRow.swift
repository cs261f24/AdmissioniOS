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
        Text(building.name)

    }
}

#Preview {
    BuildingsRow(building: buildings[0])
    BuildingsRow(building: buildings[1])
}
