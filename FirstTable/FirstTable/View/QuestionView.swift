//
//  QuestionView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import SwiftUI

struct QuestionView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showAlert: Bool = false
    
    @State private var currentQuestion: Int = 1
    @State private var totalQuestion: Int = 5
    
    @State private var question: String = "Se voce dormisse e acordasse com o dobro da sua idade, o que iria fazer?"
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 300, height: 5)
                        .foregroundStyle(Color.secondary)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(
                            width: 300*CGFloat(currentQuestion)/CGFloat(totalQuestion),
                            height: 5
                        )
                        .foregroundStyle(Color.lemonGreen)
                }
                
                
                
                Spacer()
                
                Text("\(currentQuestion)/\(totalQuestion)")
            }
            .padding()
            .padding(.horizontal,10)
            
            Spacer()
            
            ZStack{
                
                OllieView(x: 0.20, y: 0.22, yEyes: 0.02)
                .scaleEffect(0.6)
                
                
                Text(question)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top,50)
                    .font(.custom("Poppins-SemiBold", size: 23))
                    .frame(minWidth:296, minHeight: 223 + 50)
                    .background(
                        SpeechBubble()
                            .fill(.darkPurple)
                    )
                    .padding()
                    .overlay(alignment: .bottomTrailing){
                        Image("shoutingBalloon")
                            .offset(y: 20)
                    }
                    .padding(.bottom, 70)
            }
                
                Spacer()
                
                Button {
                    goForward()
                } label: {
                    ImgButton(imageName: "arrow.right").padding(.horizontal, 140).padding(10)
                }
            }
        
        .navigationTitle("Perguntas")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    showAlert.toggle()
                } label: {
                    Image(systemName: "xmark")
                }

            }
        }
        .navigationBarBackButtonHidden(true)
        .alert("Tem certeza que deseja sair?", isPresented: $showAlert) {
            
            Button("Cancelar", role: .cancel) {}
            Button("Sair", role: .destructive) {
                dismiss()
            }
                  
        } message: {
        Text("As alterações feitas serão perdidas.")
        }
    }
    
    func goForward() {
        if currentQuestion < totalQuestion {
            currentQuestion += 1
        }
    }
}



#Preview {
    QuestionView()
}
