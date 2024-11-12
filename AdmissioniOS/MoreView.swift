//
//  MoreView.swift
//  XavierMapApp
//
//  Created by Simon Benjamin on 9/27/24.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Have questions or feedback? Click the link below to send us your thoughts!")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .offset(y: -35)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .lineSpacing(5)
                Link(destination: URL(string: "https://www.xavier.edu/request-info/index")!,
                     label: {
                        Label(title: { Text("Request Info") }, icon: { Image(systemName: "magnifyingglass")
                            .font(.system(size: 22, weight: .bold, design: .default))})
                        .bold()
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                )
            }
            .navigationTitle("More")
        }
        
    }
}

#Preview {
    MoreView()
}

