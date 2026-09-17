//
//  FoundationQuestionErrorView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 17/09/26.
//

import SwiftUI

struct FoundationQuestionErrorView: View {
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack {
                Spacer(minLength: 90)
                
                Image("errorImage")
                    .scaledToFit()
                
                Text("Ative a Apple Intelligence!")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                
                Text("1. Abra os Ajustes do iPhone:")
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding(.horizontal)
                
                Text("Vá em Ajustes > Apple Intelligence e Siri.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.bottom)
                    .padding(.horizontal)
                
                Text("2. Ative a Apple Intelligence:")
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding(.horizontal)
                
                Text(" Toque no botão ao lado de ''Apple Intelligence''.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.bottom)
                    .padding(.horizontal)
                
                Text("3. Feche e abra o aplicativo novamente:")
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding(.horizontal)
                
                Text("Feche o aplicativo completamente e abra de novo para o recurso funcionar.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.bottom)
                    .padding(.horizontal)
                
                Spacer(minLength: 90)
                
                Image("sadOllie")
                    .padding(.bottom, -270)
                    .scaledToFit()
            }
            .frame(minWidth: 400, maxWidth: 700)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.horizontal, 30)
            .navigationBarBackButtonHidden(true)
        }
        .padding(.horizontal)
        .background(Color.bgBlack.ignoresSafeArea(edges: .all))
    }
}

#Preview {
    FoundationQuestionErrorView()
}
