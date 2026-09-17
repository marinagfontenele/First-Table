//
//  FoundationModels.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI
import FoundationModels

struct FoudationModels: View {
    
    @ViewBuilder
    var body: some View {
        switch SystemLanguageModel.default.availability {
            
        case .available:
            ContentView()
            
        case .unavailable (let reason):
            switch reason {
                
            case .appleIntelligenceNotEnabled:
                FoundationDisabledView()
                
            case .deviceNotEligible:
                FoundationIncompatibilityView()
                
            case .modelNotReady:
                FoundationNotReadyView()
                
            @unknown default:
                FoundationUnknowView()
            }
        }
    }
}

#Preview {
    FoudationModels()
}
