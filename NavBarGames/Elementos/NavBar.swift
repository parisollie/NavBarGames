//
//  NavBar.swift
//  IphoneIpadFirebase
//
//  Created by Paul Jaime Felix Flores on 26/04/23.
// Actualizado

import SwiftUI

struct NavBar: View {
    //Paso 1.6, Para saber si estamos en un iphone o ipad
    var device = UIDevice.current.userInterfaceIdiom
    
    //Paso 1.10 usamos bindings para añadirlos al Home
    @Binding var index : String
    @Binding var menu : Bool
    
    var body: some View {
        //Paso 1.7
        HStack{
            Text("My Games")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                //Paso 1.8, para cambiarlo al iphone ,entonces que el tamaño sea de 25 sino de 35.
                .font(.system(size: device == .phone ? 25 : 35))
            
            Spacer()
            
            if device == .pad {
                // V-151,Paso 1.9 menú ipad, Hstack para tenerlo como una web
                HStack(spacing: 25){
                    //Paso 1.11
                    ButtonView(index: $index, menu: $menu, title: "Playstation")
                    ButtonView(index: $index, menu: $menu, title: "Xbox")
                    ButtonView(index: $index, menu: $menu, title: "Nintendo")
                }
            }else{
                // Paso 1.12, menu iphone,para que se despliegue desde la derecha
                Button(action:{
                    withAnimation{
                        menu.toggle()
                    }
                }){
                    //Paso 1.13 Menu de hamburguesa,por eso las 3 líneas
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                }
            }
                
        }
        //Ponemos Modifiers
        .padding(.top, 30)
        .padding()
        .background(Color.purple)
    }
}

#Preview {
    NavBar(index: .constant("Playstation"), menu: .constant(false))
}
