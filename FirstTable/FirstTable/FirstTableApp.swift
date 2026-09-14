//
//  FirstTableApp.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI
import FoundationModels

@main
struct FirstTableApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            
            switch SystemLanguageModel.default.availability {
                
            case .available:
                if isFirstLaunch {
                    OnboardingView()
                } else {
                    ContentView()
                }
                
            case .unavailable:
                FoudationModels()
            }
        }
    }
}
