//
//  Home.swift
//  IphoneIpadFirebase
//
//  Created by Paul Jaime Felix Flores on 26/04/23.
//

import SwiftUI

struct Home: View {
    //Paso 1.14,playstation es la primera seccion
    @State private var index = "Playstation"
    @State private var menu = false
    //Paso 1.24,para poder expandir un botón 
    @State private var widthMenu = UIScreen.main.bounds.width
    //Paso 1.29
    var device = UIDevice.current.userInterfaceIdiom
    @Environment(\.horizontalSizeClass) var width
    /*
      Paso 1.30,para que sean de 3 columnas, reproduciremos esa card en tres columnas,todo depende si sea vertical u Horizontal
     */
    func getColumns() -> Int{
        return (device == .pad) ? 3 : ((device == .phone && width == .regular) ? 3 : 1)
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                //Paso 1.15, traemos nuestro NavBar
                NavBar(index: $index, menu: $menu)
                //V-152,paso 1.16 ponemos el Z es el contenido de en medio
                ZStack{
                    //paso 1.17, el index debe tener un valor por defecto por eso ponemos playstation
                    if index == "Playstation" {
                        //paso 1.31
                        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                            //Count es el número de columnas, asú que traemos el número de columnas
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: getColumns()), spacing: 20){
                                //para rellenar y repetir y la cardview
                                ForEach(1...9, id:\.self){ _ in
                                    CardView()
                                        .padding(.all)
                                }
                            }
                        }
                    //paso 1.18
                    }else if index == "Xbox"{
                        VStack{
                            Color.green
                        }
                    //Paso 1.19
                    }else{
                        VStack{
                            Color.red
                        }
                    }
                }//Fin Z-stack
            }
            // termina navbar ipad
            
            //V-153,paso 1.21 parte del iphone
            if menu {
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        
                        HStack{
                            
                            Spacer()
                            
                            Button(action:{
                                withAnimation{
                                    menu.toggle()
                                }
                            }){
                                //Paso 1.22,es el botón para cerrar xmark
                                Image(systemName: "xmark")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .padding(.top, 50)
                        
                        //Paso 1.23,trailing todo alineado a la derecha
                        VStack(alignment: .trailing){
                            ButtonView(index: $index, menu: $menu, title: "Playstation")
                            ButtonView(index: $index, menu: $menu, title: "Xbox")
                            ButtonView(index: $index, menu: $menu, title: "Nintendo")
                        }
                        Spacer()
                    }
                    .frame(width: widthMenu - 200)
                    .background(Color.purple)
                }
            }
        }.background(Color.white.opacity(0.9))
    }
}

#Preview {
    Home()
}
