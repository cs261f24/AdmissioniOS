import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Title Text
                Text("Welcome to Xavier University")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 26/255, green: 26/255, blue: 255/255))
                    .multilineTextAlignment(.center)
                    .padding()

                // Subtitle Text
                Text("Explore our beautiful campus with this self-guided tour app!")
                    .font(.title2)
                    .foregroundColor(Color(red: 26/255, green: 26/255, blue: 255/255))
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
                NavigationLink(destination: MainView()) {
                    Text("Start Tour")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 26/255, green: 26/255, blue: 255/255))
                        .foregroundColor(.yellow)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }
}

struct ToMainView: View {
    var body: some View {
        Text("Main View")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    WelcomeView()
}
