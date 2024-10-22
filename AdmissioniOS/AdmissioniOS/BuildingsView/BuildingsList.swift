//
//  BuildingsList.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 10/7/24.
//

import SwiftUI

struct BuildingsList: View {
    var body: some View {
        List(buildings) { building in
            BuildingsRow(building: building)
        }
    }
}

#Preview {
    BuildingsList()
}
