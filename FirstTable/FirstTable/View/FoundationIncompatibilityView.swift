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
                    .scaledToFit()
                    .accessibilityHidden(true)
                
                Text("Ops, recurso indisponível!")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                
                Text("Seu aparelho não é compatível com a Apple Intelligence — não é possível continuar.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.bottom)
                    .padding(.horizontal)
                    .accessibilityLabel("Seu aparelho não é compatível com a Apple Intelligence: não é possível continuar.")
                
                Spacer()
                
                Image("cryingOllie")
                    .padding(.bottom, -270)
                    .scaledToFit()
                    .accessibilityHidden(true)
            }
            .padding(.horizontal, 27)
            .background(Color.bgBlack.ignoresSafeArea(edges: .all))
            .multilineTextAlignment(.center)
            
            ScrollView (showsIndicators: false){
                VStack {
                    Spacer(minLength: 30)
                    
                    Image("errorImage")
                        .scaledToFit()
                        .accessibilityHidden(true)
                    
                    Text("Ops, recurso indisponível!")
                        .font(.custom("Poppins-Bold", size: 24))
                        .padding()
                    
                    Text("Seu aparelho não é compatível com a Apple Intelligence — não é possível continuar.")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding(.bottom)
                        .padding(.horizontal)
                        .accessibilityLabel("Seu aparelho não é compatível com a Apple Intelligence: não é possível continuar.")
                    
                    Spacer(minLength: 30)
                    
                    Image("cryingOllie")
                        .padding(.bottom, -270)
                        .scaledToFit()
                        .accessibilityHidden(true)
                }
                .frame(minWidth: 400, maxWidth: 700)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.horizontal, 30)
            }
            .padding(.horizontal)
        }
        .background(Color.bgBlack.ignoresSafeArea(edges: .all))
    }
}

#Preview {
    FoundationIncompatibilityView()
}

