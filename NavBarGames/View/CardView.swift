//
//  CardView.swift
//  NavBarGames
//
//  Created by Paul F on 31/03/25.
//

import SwiftUI
//V-154,paso 1.28 hacemos la CardView
struct CardView: View {
    var body: some View {
        VStack(spacing: 20){
            
            Image("re4")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Resident Evil 4 Remake")
                .font(.title)
                .bold()
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

#Preview(){
    CardView()
}
