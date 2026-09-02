//
//  ChallengeView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 01/09/26.
//

import SwiftUI

struct ChallengeView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            MainButtonView(title: "Fotografia Relâmpago")
            
            Spacer()
            
            ZStack{
                Image("PurpleSpeech")
                
                Text("Quem é o mais animado?")
                    .font(.custom("Poppins-SemiBold", size: 24))
                    .padding(.horizontal, 35)
                    .padding(.bottom)
            }
            
            Spacer()
            
            Image(systemName: "camera.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 41, height: 33)
                .foregroundStyle(.black)
                .padding(.vertical, 14)
                .padding(.horizontal, 38)
                .background(Color(.lemonGreen).cornerRadius(20))
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    ChallengeView()
}
