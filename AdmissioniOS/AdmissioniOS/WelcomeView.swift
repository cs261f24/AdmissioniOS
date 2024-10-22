//
//  WelcomeView.swift
//  AdmissioniOS
//
//  Created by Lance Silliman on 10/17/24.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
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

            // Welcome Image/Logo (replace "campusImage" with  actual image/logo name)
            if let uiImage = UIImage(named: "xavier-logo-moreblue") {
                            Image(uiImage: uiImage)
                                .resizable() // Makes the image resizable
                                .aspectRatio(contentMode: .fit) // Keeps the aspect ratio
                                .frame(width: 200, height: 200) // Customize the frame size for the logo
                                .padding(.top, 40) // Optional padding
                        } else {
                            Text("Image not found") // Error handling in case image is missing
                        }

            // Start Tour Button
            Button(action: {
                // Action to go to the next screen
                print("Start Tour button tapped")
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
    }
}


#Preview{
    WelcomeView()
}
