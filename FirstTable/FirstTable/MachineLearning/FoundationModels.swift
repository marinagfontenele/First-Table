//
//  FoundationModels.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI
import FoundationModels

struct FoudationModels: View {
    
    var availabilityMessage: String {
        switch SystemLanguageModel.default.availability {
            
        case .available:
            return "O Foundation Models está disponível."
            
        case .unavailable(let reason):
            
            switch reason {
                
            case .appleIntelligenceNotEnabled:
                return "O Apple Intelligence não está ativado. Ative-o em Ajustes."
                
            case .deviceNotEligible:
                return "Este dispositivo não é compatível com o Apple Intelligence."
                
            case .modelNotReady:
                return "O modelo de linguagem ainda não está pronto. Tente novamente mais tarde."
                
            @unknown default:
                return "O modelo de linguagem não está disponível por um motivo desconhecido."
            }
        }
    }
    
    var body: some View {
        switch SystemLanguageModel.default.availability {
            
        case .available:
            Text("The language model is available.")
                .padding()
            
        case .unavailable:
            ContentUnavailableView(
                availabilityMessage,
                systemImage: "apple.intelligence.badge.xmark"
            )
        }
    }
}

#Preview {
    FoudationModels()
}
