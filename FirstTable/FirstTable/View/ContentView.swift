//
//  ContentView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            ZStack{
                GridBackground()
                ScrollView {
                    VStack {
                        Spacer(minLength: 150)
                        
                        Image("logo")
                            .offset(x:-20)
                        
                        Spacer(minLength: 75)
                        
                        NavigationLink {
                            InformationsView()
                        } label: {
                            MainButtonView(title: "Iniciar")
                        }
                        .padding(.horizontal, 75)
                        .padding(.vertical, 15)
                        
    //                    Button {
    //
    //                    } label: {
    //                        MainButtonView(title: "Galeria")
    //                    }
    //                    .padding(.horizontal, 40)
    //                    .padding(.vertical, 8)
                        
                        
                        NavigationLink {
                            TutorialView()
                        } label: {
                            MainButtonView(title: "Tutorial")
                        }
                        .padding(.horizontal, 75)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .information: InformationsView()
                case .description: DescriptionView()
                case .category: CategoryView()
                case .loading: LoadingView()
                case .challenge: ChallengeView()
                case .camera: CameraView()
                case .confirmation: PhotoConfirmationView()
                case .question: QuestionView()
                case .memory: MemoryView()
                }
            }
        }
        .environmentObject(navigation)
    }
}

#Preview {
    ContentView()
}
