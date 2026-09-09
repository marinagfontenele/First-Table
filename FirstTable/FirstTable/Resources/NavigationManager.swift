//
//  NavigationManager.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 08/09/26.
//

import SwiftUI
import Combine

enum AppRoute: Hashable {
    case category, camera, challenge, description, information, loading, memory, confirmation, question
}

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    //information
    @Published var totalQuestion: Int? = nil
    @Published var groupName: String? = nil
    
    //description
    @Published var photoSession: PhotoSession? = nil
    
    //loading
    @Published var modelService: FoundationModelsSession? = nil
    
    //camera
    @Published var capturedImage: UIImage? = nil
    
    func navigate(to route: AppRoute){
        path.append(route)
    }
    
    func goBack(){
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func goHome(){
        path = NavigationPath()
    }
}
