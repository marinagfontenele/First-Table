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
    @Bindable var photoSession: PhotoSession
    @State private var showChallengeView: Bool = false
    @State private var showMemoryView: Bool = false
    @State var modelService = FoundationModelsSession()
    
    var progress: CGFloat {
        guard photoSession.totalQuestions > 0 else { return 0 }
        return CGFloat(photoSession.currentQuestion) / CGFloat(photoSession.totalQuestions)
    }
    
    @State private var question: String = "Se voce dormisse e acordasse com o dobro da sua idade, o que iria fazer?"
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 280, height: 5)
                        .foregroundStyle(Color.secondary)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(
                            width: 280*progress,
                            height: 5
                        )
                        .foregroundStyle(Color.lemonGreen)
                }
                
                Spacer()
                
                Text("\(photoSession.currentQuestion)/\(photoSession.totalQuestions)")
            }
            .padding()
            .padding(.horizontal,10)
            
            Spacer()
            
            ZStack{
                OllieView(yEyes: 12)
                    .offset(x:-100,y: -200)
                    .scaleEffect(0.6)
                
                Text(modelService.questions[currentQuestion - 1].text)
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
                
//                Button {
//                    for option in modelService.questions {
//                        print(option.text)
//                    }
//                } label: {
//                    ImgButton(imageName: "arrow.right").padding(.horizontal, 140).padding(10)
//                }
//                
            }
                Spacer()
                
                Button {
                    goForward()
                } label: {
                    ImgButton(imageName: "arrow.right").padding(.horizontal, 140).padding(10)
                }
            }
        .background(Color.bgBlack.ignoresSafeArea())
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
        .navigationDestination(isPresented: $showChallengeView) {
            ChallengeView(
                onConfirm: {
                    showChallengeView = false
                },
                photoSession: photoSession
            )
        }
        .navigationDestination(isPresented: $showMemoryView){
            if photoSession.totalQuestions == 5 {
                MemoryThreePicturesView(photoSession: photoSession)
            } else {
                MemoryFivePicturesView(photoSession: photoSession)
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
        let questionJustFinished = photoSession.currentQuestion
        if photoSession.shouldTakePhoto(afterQuestion: questionJustFinished){
            photoSession.goToNextQuestion()
            showChallengeView = true
            return
        }
        if questionJustFinished == photoSession.totalQuestions {
            showMemoryView = true
            return
        }
        
        photoSession.goToNextQuestion()
    }
}



//#Preview {
//    QuestionView(photoSession: photoSession)
//}
