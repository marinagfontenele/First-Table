//
//  FoundationDisabledView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 15/09/26.
//

import SwiftUI

struct FoundationDisabledView: View {
    var body: some View {
        ViewThatFits (in: .vertical) {
            VStack {
                Spacer()
                
                Image("errorImage")
                    .accessibilityHidden(true)
                
                Text("Ative a Apple Intelligence!")                        .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                
                Text("1. Abra os Ajustes do iPhone:")
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding(.horizontal)
                
                Text("Vá em Ajustes > Apple Intelligence e Siri.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.bottom)
                    .padding(.horizontal, 11)
                    .accessibilityLabel("Vá em Ajustes, depois em Apple Intelligence e Siri.")
                
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
                
                Spacer()

                
                Image("sadOllie")
                    .padding(.bottom, -270)
                    .accessibilityHidden(true)
                    
            }
            .padding(.horizontal, 27)
            .background(Color.bgBlack.ignoresSafeArea(edges: .all))
            .multilineTextAlignment(.center)
            .navigationBarBackButtonHidden(true)
            
            ScrollView (showsIndicators: false){
                VStack {
                    Spacer(minLength: 50)
                    
                    Image("errorImage")
                        .scaledToFit()
                        .accessibilityHidden(true)
                    
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
                        .accessibilityLabel("Vá em Ajustes, depois em Apple Intelligence e Siri.")
                    
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
                    
                    Spacer(minLength: 50)
                    
                    Image("sadOllie")
                        .padding(.bottom, -270)
                        .scaledToFit()
                        .accessibilityHidden(true)
                }
                .frame(minWidth: 400, maxWidth: 700)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.horizontal, 30)
                .navigationBarBackButtonHidden(true)
            }
            .padding(.horizontal)
        }
        .background(Color.bgBlack.ignoresSafeArea(edges: .all))
    }
}

#Preview {
    FoundationDisabledView()
}
