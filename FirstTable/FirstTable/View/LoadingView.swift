//
//  LoadingView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 06/09/26.
//

import SwiftUI

struct LoadingView: View {
    let totalQuestion: Int
    @State var categories: [Category] = []
    @State var description: String = ""
    @State var modelService = FoundationModelsSession()
    @State private var currentQuestion: Int = 1
    @State var navigateToQuestions: Bool = false
    @Bindable var photoSession: PhotoSession
    
    var body: some View {
        ZStack{
            Color(.bgBlack).ignoresSafeArea()
            VStack(alignment: .center){
                ProgressView()
                    .scaleEffect(2)
                    .tint(.lemonGreen)
                    .padding()
                
                Text("Formulando\nPerguntas")
                    .font(Font.custom("Poppins-SemiBold", size: 32))
                    .multilineTextAlignment(.center)
                
                OllieView(yEyes: 0.02)
                    .offset(y:160)
                    .scaleEffect(2)
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.bgBlack.ignoresSafeArea())
        .navigationDestination(isPresented: $navigateToQuestions) {
            QuestionView(photoSession: photoSession, modelService: modelService)
        }
        .task {
            modelService.numberQuestions = totalQuestion
            modelService.descriptionGroup = description
            modelService.categories = categories
            
            await modelService.generateQuestions()
            
            navigateToQuestions = true
        }
    }
    
}

//#Preview {
//    LoadingView(totalQuestion: 5)
//}
