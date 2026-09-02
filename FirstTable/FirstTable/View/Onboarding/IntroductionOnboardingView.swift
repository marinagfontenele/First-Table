//
//  IntroductionOnboardingView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 02/09/26.
//

import SwiftUI

struct IntroductionOnboardingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Image("introductionOnboarding")
                
                VStack(alignment: .center) {
                    Text("Quebra o gelo, cria memórias")
                        .font(Font.custom("Poppins-SemiBold", size: 32))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 8)
                        .padding(.top, 80)
                    
                    Text("Perguntas pensadas para o seu grupo")
                        .font(Font.custom("Poppins-Regular", size: 20))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 8)
                    
                    
                }
            }
            NavigationLink {
                DescriptionView()
            } label: {
                MainButtonView(title: "Continuar")
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 8)
            
            Spacer()
        }
    }
}

#Preview {
    IntroductionOnboardingView()
}
