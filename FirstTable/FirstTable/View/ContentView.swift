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
            ScrollView {
                VStack {
                    Spacer(minLength: 150)
                    
                    Text("Konver\nsácio")
                        .font(Font.custom("Poppins-SemiBold", size: 60, relativeTo: .title))
                    
                    Spacer(minLength: 150)
                    
                    NavigationLink {
                        InformationsView()
                    } label: {
                        MainButtonView(title: "Iniciar")
                    }
                    .padding(.horizontal, 40)
                    
                    Button {
                        
                    } label: {
                        MainButtonView(title: "Galeria")
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    
                    
                    Button {
                        
                    } label: {
                        MainButtonView(title: "Tutorial")
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
