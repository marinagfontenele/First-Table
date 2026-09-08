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
        VStack {
            ProgressView("Gerando perguntas...")
                .font(.custom("Poppins-SemiBold", size: 18))
                .foregroundColor(.lemonGreen)
                .tint(.lemonGreen)
                .padding()
                .background(Color.lemonBackground)
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
