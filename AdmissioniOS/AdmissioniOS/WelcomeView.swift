//
//  WelcomeView.swift
//  AdmissioniOS
//
//  Created by Lance Silliman on 10/17/24.
//
import SwiftUI

struct WelcomeView: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {  // Add this NavigationStack
            VStack {
                // Title Text
                Text("Welcome to Xavier University")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 26/255,green: 26/255, blue: 255/255))
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Subtitle Text
                Text("Explore our beautiful campus with this self-guided tour app!")
                    .font(.title2)
                    .foregroundColor(Color(red: 26/255,green: 26/255, blue: 255/255))
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Welcome Image/Logo
                if let uiImage = UIImage(named: "xavier-logo-moreblue") {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top, 40)
                } else {
                    Text("Image not found")
                }
                
                // Start Tour Button
                Button(action: {
                    navigate = true
                }) {
                    Text("Start Tour")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 26/255,green: 26/255, blue: 255/255))
                        .foregroundColor(.yellow)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 30)
            }
            .padding()
            .navigationDestination(isPresented: $navigate) {
                MainView()
                    .navigationBarBackButtonHidden(true)  // This hides the back button
            }
        }
    }
}

#Preview {
    WelcomeView()
}
