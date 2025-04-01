//
//  ContentView.swift
//  NavBarGames
//
//  Created by Paul F on 31/03/25.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            //Paso 1.20,ignora toda las areas,para no tener partes blancas.
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //Paso 1.32
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}



#Preview {
    ContentView()
}
