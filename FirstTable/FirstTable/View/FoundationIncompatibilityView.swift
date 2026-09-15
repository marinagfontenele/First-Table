//
//  FoundationIncompatibilityView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 15/09/26.
//

import SwiftUI

struct FoundationIncompatibilityView: View {
    var body: some View {
        ViewThatFits (in: .vertical) {
            VStack {
                Spacer()
                
                Image("errorImage")
                
                Text("Ative a Apple Intelligence!")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                
                Text("1. Abra os Ajustes do iPhone  Vá em Ajustes > Apple Intelligence e Siri.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding()
                
                Text("2. Ative a Apple Intelligence  Toque no botão ao lado de ''Apple Intelligence''.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding()
                
                Text("3. Feche e abra o aplicativo novamente\nFeche o aplicativo completamente e abra de novo para o recurso funcionar.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding()
                
                Spacer()
                
                Image("sadOllie")
                    .padding(.bottom, -270)
            }
            .background(Color.bgBlack.ignoresSafeArea())
            .multilineTextAlignment(.center)
            
            ScrollView (showsIndicators: false){
                VStack {
                    Spacer()
                    
                    Image("errorImage")
                    
                    Text("Ative a Apple Intelligence!")
                        .font(.custom("Poppins-Bold", size: 24))
                        .padding()
                    
                    Text("1. Abra os Ajustes do iPhone  Vá em Ajustes > Apple Intelligence e Siri.")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding()
                    
                    Text("2. Ative a Apple Intelligence  Toque no botão ao lado de ''Apple Intelligence''.")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding()
                    
                    Text("3. Feche e abra o aplicativo novamente\nFeche o aplicativo completamente e abra de novo para o recurso funcionar.")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding()
                    
                    Spacer()
                    
                    Image("sadOllie")
                        .padding(.bottom, -270)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            }
            .background(Color.bgBlack.ignoresSafeArea())
        }
    }
}

#Preview {
    FoundationIncompatibilityView()
}
