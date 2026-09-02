//
//  OnboardingView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 02/09/26.
//

import SwiftUI
import PhotosUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            ForEach(0..<5) { index in
                VStack {
                    Text("Page \(index + 1)")
                        .font(.largeTitle)
                        .padding()
                    Image(systemName: "\(index + 1).circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                }
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .padding()
                
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
        Button {
            
        } label: {
            MainButtonView(title: "Continuar")
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 8)
        
        Spacer()
    }
}

#Preview {
    OnboardingView()
}

enum Onboarding: String, CaseIterable, Codable {
    case introduction;
    case configuration;
    case theme;
    case rule;
    case surprise;
    case memory;
    
    var title: String {
        switch self {
        case .introduction: return "Quebra o gelo, cria memórias"
        case .configuration: return "Configure em segundos"
        case .theme: return "Escolha os temas"
        case .rule: return "Sem pressa, sem regras"
        case .surprise: return "Cuidado com as surpresas"
        case .memory: return "Leve uma lembrança"
        }
    }
    
    var subtitle: String {
        switch self {
        case .introduction: return "Perguntas pensadas para o seu grupo."
        case .configuration: return "Nome do grupo, quantidade de perguntas e um resumo de vocês."
        case .theme: return "As perguntas se adaptam ao que vocês curtem falar."
        case .rule: return "Leiam, conversem e passem para a próxima quando quiserem."
        case .surprise: return "De vez em quando, uma pergunta vira desafio de foto."
        case .memory: return "No fim, as fotos viram um template prontinho para compartilhar."
        }
    }
    
    var image: Image {
        switch self {
        case .introduction: return Image("introductionOnboarding")
        case .configuration: return Image("configurationOnboarding")
        case .theme: return Image("themesOnboarding")
        case .rule: return Image("ruleOnboarding")
        case .surprise: return Image("surpriseOnboarding")
        case .memory: return Image("memoryOnboarding")
        }
    }
}
