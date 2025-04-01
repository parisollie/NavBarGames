//
//  ButtonView.swift
//  IphoneIpadFirebase
//
//  Created by Paul Jaime Felix Flores on 26/04/23.
//

import SwiftUI

struct ButtonView: View {
    //V-150,Paso 1.0 ,el index es para dirigirnos a varias partes de nuestra app
    @Binding var index : String
    //Para nuestro meu desplegable
    @Binding var menu : Bool
    
    //Paso 1.25 ,variable
    var device = UIDevice.current.userInterfaceIdiom
    //para el título de nuestro botón
    var title : String
    
    var body: some View {
        //Paso 1.1
        Button(action:{
            //paso 1.2 Para darle animacion al botón
            withAnimation{
                //Paso 1.3
                index = title
                //Paso 1.26,sólo haremos en el menú en el iphone
                if device == .phone{
                    menu.toggle()
                }
            }
        }){
            //Paso 1.4,El título de nuestro botón
            Text(title)
                .font(.title)
                /*Paso 1.5, para que el botón se mantenga en negritas y los demás no
                 Si es el título de nuestro boton lo ponemos en negritas sino no entonces no
                 */
                .fontWeight(index == title ? .bold : .none)
                .foregroundColor(index == title ? .white : Color.white.opacity(0.6))
        }
    }
}

#Preview {
    ButtonView(index: .constant("Playstation"), menu: .constant(false), title: "Playstation")
}

