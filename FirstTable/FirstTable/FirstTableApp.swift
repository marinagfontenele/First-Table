//
//  FirstTableApp.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import SwiftUI

@main
struct FirstTableApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
