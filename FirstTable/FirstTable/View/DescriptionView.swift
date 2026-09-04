//
//  DescriptionView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 31/08/26.
//

import SwiftUI

struct DescriptionView: View {
    
    @State private var description: String = ""
    @State private var showError = false
    @State private var goToCategory = false
    
    @FocusState private var isDescriptionFocused: Bool
    
    let totalQuestion: Int
    
    var body: some View {
            ScrollView {
                VStack {
                    Text("Descreva seu grupo")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                    
                    ZStack(alignment: .topLeading) {
                        
                     
                            TextEditor(text: $description)
                                .focused($isDescriptionFocused)
                                .frame(minHeight: 150)
                                .padding()
                                .scrollContentBackground(.hidden)
                                .background(Color.lemonGreen.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .font(.custom("Poppins-SemiBold", size: 16))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke( showError ? .red : Color.lemonGreen, lineWidth: 2 )
                                }
                            
                      
                            
                            if description.isEmpty {
                                Text("Ex: “Nós somos estudantes, gostamos de jogar”")
                                    .font(.custom("Poppins-SemiBold", size: 16))
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 21)
                                    .allowsHitTesting(false)
                            }
                        
                    }
                    .padding(.horizontal)
                    
                    VStack{
                        if showError { Text("Descreva um pouco sobre o seu grupo.") .font(.custom("Poppins-SemiBold", size: 13))
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 4)
                    
                    Text("As características vão influenciar algumas perguntas, descrevam bem suas preferências")
                        .lineSpacing(0.5)
                        .padding(.top, 4)
                        .padding(.horizontal, 20)
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .foregroundStyle(.gray)
                    
                    Button {
                        validateAndContinue()

                    } label: {
                        MainButtonView(title: "Continuar")
                            .frame(width: 300)
                    }
                        .padding(.vertical, 20)
                    
                    Spacer()
                    
                    OllieView(yEyes: 0.02)
                        .offset(y:100)
                        .scaleEffect(2)
                }
            }
            .background(Color.bgBlack.ignoresSafeArea())
            .onTapGesture {
                isDescriptionFocused = false
            }
            .navigationDestination(isPresented: $goToCategory) {
                CategoryView(totalQuestion: totalQuestion)
            }
        .navigationTitle("Informações")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func validateAndContinue() {
        let descriptionIsEmpty = description
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .isEmpty
        
        if descriptionIsEmpty {
            showError = true
            isDescriptionFocused = true
        } else {
            showError = false
            isDescriptionFocused = false
            goToCategory = true } }
}

//#Preview {
//    DescriptionView()
//}
