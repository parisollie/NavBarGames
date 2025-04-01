//
//  SplashScreenView.swift
//  IphoneIpadFirebase
//
//  Created by Paul Jaime Felix Flores on 27/08/24.
//

import SwiftUI

struct SplashScreenView: View {
    //@StateObject var viewModel = AuthViewModel()
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            ContentView()
                //.environmentObject(viewModel)
        } else {
            VStack {
                VStack {
                    Image("Fondo")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                    Text("Resident evil 4")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}



#Preview {
    SplashScreenView()
}
