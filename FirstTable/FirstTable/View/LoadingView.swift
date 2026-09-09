//
//  LoadingView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 06/09/26.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var navigation: NavigationManager
    @State var categories: [Category] = []
    @State var description: String = ""
    @State var modelService = FoundationModelsSession()
    @State private var currentQuestion: Int = 1

    
    var body: some View {
        if let totalQuestion = navigation.totalQuestion,
           let photoSession = navigation.photoSession{
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
            .task {
                modelService.numberQuestions = totalQuestion
                modelService.descriptionGroup = description
                modelService.categories = categories
                
                await modelService.generateQuestions()
                
                navigation.modelService = modelService
                navigation.navigate(to: .challenge)
            }
        }
    }
    
}

//#Preview {
//    LoadingView(totalQuestion: 5)
//}
