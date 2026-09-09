//
//  QuestionView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var navigation: NavigationManager
    @State private var showAlert: Bool = false
    @State private var currentQuestion: Int = 1
    @State private var question: String = "Se voce dormisse e acordasse com o dobro da sua idade, o que iria fazer?"
    
    var body: some View {
        if let photoSession = navigation.photoSession,
           let modelService = navigation.modelService{
            VStack {
                HStack {
                    ZStack(alignment: .leading){
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 280, height: 5)
                            .foregroundStyle(Color.secondary)
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(
                                width: 280*(CGFloat(photoSession.currentQuestion) / CGFloat(photoSession.totalQuestions)),
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
                    Text(modelService.questions[photoSession.currentQuestion - 1].text)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .padding(.top,50)
                        .font(.custom("Poppins-SemiBold", size: 23))
                        .padding(.vertical)
                        .frame(minWidth:296, minHeight: 223 + 50)
                        .background(
                            SpeechBubble()
                                .fill(.darkPurple)
                        )
                        .background(alignment: .topLeading){
                            OllieView(yEyes: 12)
                                .offset(x:-50,y: -100)
                                .scaleEffect(0.6)
                        }
                        .padding()
                        .overlay(alignment: .bottomTrailing){
                            Image("shoutingBalloon")
                                .offset(y: 30)
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
                        let questionJustFinished = photoSession.currentQuestion
                        if photoSession.shouldTakePhoto(afterQuestion: questionJustFinished){
                            photoSession.goToNextQuestion()
                            navigation.navigate(to: .challenge)
                            return
                        }
                        if questionJustFinished == photoSession.totalQuestions {
                            navigation.navigate(to: .memory)
                            return
                        }
                        
                        photoSession.goToNextQuestion()
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
            .navigationBarBackButtonHidden(true)
            .alert("Tem certeza que deseja sair?", isPresented: $showAlert) {
                
                Button("Cancelar", role: .cancel) {}
                Button("Sair", role: .destructive) {
                    navigation.goHome()
                }
                      
            } message: {
            Text("As alterações feitas serão perdidas.")
            }
        }
        }
    
//    func goForward() {
//        let questionJustFinished = photoSession.currentQuestion
//        if photoSession.shouldTakePhoto(afterQuestion: questionJustFinished){
//            photoSession.goToNextQuestion()
//            navigation.navigate(to: .challenge)
//            return
//        }
//        if questionJustFinished == photoSession.totalQuestions {
//            navigation.navigate(to: .memory)
//            return
//        }
//        
//        photoSession.goToNextQuestion()
//    }
}



//#Preview {
//    QuestionView(photoSession: photoSession)
//}
