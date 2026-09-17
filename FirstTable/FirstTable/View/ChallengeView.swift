//
//  ChallengeView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 01/09/26.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var navigation: NavigationManager
    @State private var scale = 0.4
    @State private var showAlert: Bool = false
    
    var body: some View {
        if let photoSession = navigation.photoSession{
            let modelService = navigation.modelService
            VStack {
                
                OllieView(yEyes: 13)
                    .scaleEffect(scale)
                    .frame(width: 262.22*scale, height: 245*scale)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 15)
                    .offset(x: 50)
                
                
                Text("Fotografia Relâmpago")
                    .font(.custom("Poppins-SemiBold", size: 24))
                    .foregroundStyle(.lemonGreen)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .background(.bgBlack)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.lemonGreen, lineWidth: 5)
                    )
                    .offset(y: -60)
                    .padding(.horizontal, 25)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                ZStack{
                    Image("PurpleSpeech")
                        .padding(.bottom,50)
                    
                    if let task = photoSession.currentTask {
                        Text(task.instruction)
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .padding(.horizontal, 35)
                            .padding(.bottom,75)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
                
                Button {
                    navigation.navigate(to: .camera)
                } label: {
                    Text("Fotografar")
                        .font(.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.darkGreen)
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .background(.lemonGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.vertical, 25)
                }
            }
            .navigationTitle("Desafio")
            .padding(.horizontal, 40)
            .background(Color.bgBlack.ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
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
}

//#Preview {
//    ChallengeView()
//}
