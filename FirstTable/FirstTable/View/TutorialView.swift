//
//  TutorialView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 03/09/26.
//

import SwiftUI
import PhotosUI

struct TutorialView: View {
    @State private var currentOption: Onboarding = .introduction
    @State private var selectedIndex: Int = 0
    private let allPages = Onboarding.allCases
    
    var body: some View {
        VStack{
            TabView(selection: $currentOption) {
                ForEach(allPages) { option in
                    VStack(alignment: .center) {
                        Image(option.imageName)
                            .padding(.top, 40)
                        
                        Spacer()
                        
                        Text(option.title)
                            .font(Font.custom("Poppins-SemiBold", size: 32))
                            .padding(.bottom, 8)
                        
                        Text(option.subtitle)
                            .font(Font.custom("Poppins-Regular", size: 20))
                            .padding(.bottom, 50)
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
                    .padding()
                    .tag(option)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .tabViewStyle(.page(indexDisplayMode: .always))
            .onAppear {
                UIPageControl.appearance().pageIndicatorTintColor = .lemonBackground
                UIPageControl.appearance().currentPageIndicatorTintColor = .lemonGreen
            }
        }
        
        if currentOption != .memory {
            Button {
                advancePage()
            } label: {
                MainButtonView(title: "Continuar")
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 8)
            
            Spacer()
        } else {
            Button {
                advancePage()
            } label: {
                MainButtonView(title: "Concluir")
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 8)
            
            Spacer()
        }
    }
    
    private func advancePage() {
        if let currentIndex = allPages.firstIndex(of: currentOption) {
            let nextIndex = currentIndex + 1
            
            if nextIndex < allPages.count {
                currentOption = allPages[nextIndex]
            }
        }
    }
}

#Preview {
    TutorialView()
}
