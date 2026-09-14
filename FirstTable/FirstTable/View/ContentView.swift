//
//  ContentView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = NavigationManager()
    @State private var isFloating = false
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            ZStack{
                GridBackground()
                ViewThatFits {
                    VStack {
                        Spacer(minLength: 150)
                        
                        ZStack{
                            
                            Image("pupleStar")
                                .resizable()
                                .frame(width: 190, height: 190)
                                .offset(x: -135, y: isFloating ? -35 : -25)
                            
                            Image("kovensatioLogo")
                                .offset(x: 5)
                            
                            Image("baloon")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(x: 110, y: isFloating ? 45 : 55)
                            
                            Image("wave")
                                .resizable()
                                .frame(width: 120, height: 100)
                                .offset(x: 125, y: isFloating ? -120 : -110)
                        }
                        .onAppear {
                            withAnimation(
                                .easeInOut(duration: 2)
                                .repeatForever(autoreverses: true)
                            ) {
                                isFloating = true
                            }
                        }
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
                    
                    ScrollView {
                        VStack {
                            Spacer(minLength: 150)
                            
                            ZStack{
                                
                                Image("pupleStar")
                                    .resizable()
                                    .frame(width: 190, height: 190)
                                    .offset(x: -135, y: -30)

                                
                                Image("kovensatioLogo")
                                    .offset(x: 5)
                                
                                Image("baloon")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .offset(x: 110, y: 50)
                                
                                Image("wave")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                    .offset(x: 125, y: -115)
                                
                            }
                            
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
