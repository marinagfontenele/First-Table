//
//  DescriptionView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 31/08/26.
//

import SwiftUI

struct DescriptionView: View {
    
    @State private var description: String = ""
    
    var body: some View {
        VStack {
            Text("Descreva seu grupo:")
                .font(.custom("Poppins-SemiBold", size: 20))
                .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                .padding()
                .padding(.top, 30)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $description)
                    .frame(height: 150)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color.lemonGreen.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .font(.custom("Poppins-SemiBold", size: 14))
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.lemonGreen, lineWidth: 2)
                    }
                
                if description.isEmpty {
                    Text("Ex: “Nós somos estudantes, gostamos de jogar”")
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .foregroundStyle(.gray)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 16)
                                    .allowsHitTesting(false)
                }
            }
            .padding(.horizontal)
            
            Text("Algumas perguntas serão baseadas nas características informadas, descrevam bem suas preferências")
                .padding(.top, 10)
                .font(.custom("Poppins-SemiBold", size: 12))
                .lineSpacing(5)
            
            MainButtonView(title: "Continuar")
                .padding(30)
                .padding(.horizontal,50)
            
            Spacer()
        }
        .navigationTitle("Informações")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DescriptionView()
}
