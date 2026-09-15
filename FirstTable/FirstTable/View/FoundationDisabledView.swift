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
                
                Text("Ops, recurso indisponível!")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                
                Text("Seu aparelho não é compatível com a Apple Intelligence — não é possível continuar.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.horizontal)
                
                Spacer()
                
                Image("cryingOllie")
                    .padding(.bottom, -270)
            }
            .background(Color.bgBlack.ignoresSafeArea())
            .multilineTextAlignment(.center)
            
            ScrollView (showsIndicators: false){
                VStack {
                    Spacer()
                    
                    Image("errorImage")
                    
                    Text("Ops, recurso indisponível!")
                        .font(.custom("Poppins-Bold", size: 24))
                        .padding()
                    
                    Text("Seu aparelho não é compatível com a Apple Intelligence — não é possível continuar.")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Image("cryingOllie")
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
    FoundationDisabledView()
}
