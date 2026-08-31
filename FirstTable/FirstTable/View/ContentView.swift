//
//  ContentView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Konver\nsácio")
                .font(Font.largeTitle)
                .fontWeight(Font.Weight.bold)
            
            Spacer()
            
            MainButtonView(title: "Iniciar")
            MainButtonView(title: "Galeria")
            MainButtonView(title: "Tutorial")
            
            Spacer(minLength: 100)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
