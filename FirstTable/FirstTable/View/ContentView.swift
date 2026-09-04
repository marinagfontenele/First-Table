//
//  ContentView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                GridBackground()
                ScrollView {
                    VStack {
                        Spacer(minLength: 150)
                        
                        Image("logo")
                            .offset(x:-20)
                        
                        Spacer(minLength: 75)
                        
                        NavigationLink {
                            InformationsView()
                        } label: {
                            MainButtonView(title: "Iniciar")
                        }
                        .padding(.horizontal, 75)
                        .padding(.vertical, 15)
                        
    //                    Button {
    //
    //                    } label: {
    //                        MainButtonView(title: "Galeria")
    //                    }
    //                    .padding(.horizontal, 40)
    //                    .padding(.vertical, 8)
                        
                        
                        NavigationLink {
                            TutorialView()
                        } label: {
                            MainButtonView(title: "Tutorial")
                        }
                        .padding(.horizontal, 75)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
