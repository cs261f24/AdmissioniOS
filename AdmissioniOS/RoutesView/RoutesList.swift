//
//  RoutesList.swift
//  AdmissioniOS
//
//  Created by Simon Benjamin on 10/22/24.
//

import SwiftUI

struct RoutesList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredColleges: [Colleges] {
        modelData.colleges.filter { colleges in
            (!showFavoritesOnly || colleges.isFavorite)
            }
        }
    
    var body: some View {
        NavigationSplitView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredColleges) { Colleges in
                    NavigationLink {
                        RoutesDetail(college: Colleges)
                            .offset(y: -65)
                    }
                    label: {
                        RoutesRow(college: Colleges)
                    }
                }
            }
            .animation(.default, value: filteredColleges)
            .navigationTitle("Routes")
        } detail: {
            Text("Routes")
        }
    }
}
#Preview {
    RoutesList()
        .environment(ModelData())

}
