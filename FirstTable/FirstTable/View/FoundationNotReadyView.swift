//
//  FoundationNotReadyView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 16/09/26.
//

import SwiftUI

struct FoundationNotReadyView: View {
    var body: some View {
        ViewThatFits (in: .vertical) {
            VStack {
                Spacer()
                
                Image("errorImage")
                    .scaledToFit()
                
                Text("A integração com a Apple Intelligence ainda está em andamento!")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                
                Text("Aguarde alguns instantes e reinicie o aplicativo.")
                    .font(.custom("Poppins-Medium", size: 16))
                    .padding(.bottom)
                    .padding(.horizontal)
                
                Spacer()
                
                Image("sadOllie")
                    .padding(.bottom, -270)
                    .scaledToFit()
            }
            .padding(.horizontal, 27)
            .background(Color.bgBlack.ignoresSafeArea(edges: .all))
            .multilineTextAlignment(.center)
            
            ScrollView (showsIndicators: false){
                VStack {
                    Spacer(minLength: 30)
                    
                    Image("errorImage")
                        .scaledToFit()
                    
                    Text("A integração com a Apple Intelligence ainda está em andamento!")
                        .font(.custom("Poppins-Bold", size: 24))
                        .padding()
                    
                    Text("Aguarde alguns instantes e reinicie o aplicativo.")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    Spacer(minLength: 30)
                    
                    Image("sadOllie")
                        .padding(.bottom, -270)
                        .scaledToFit()
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
    FoundationNotReadyView()
}

