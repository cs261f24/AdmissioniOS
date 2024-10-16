//
//  BuildingsView.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 9/27/24.
//

import SwiftUI

// Combines BuildingsDetail, BuildingsList, and BuildingsRow to
// create the overall buildings view.
struct BuildingsView: View {
    
    var body: some View {
        BuildingsList()
    }
}

#Preview {
    BuildingsView()
}
