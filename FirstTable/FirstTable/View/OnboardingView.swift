//
//  OnboardingView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 02/09/26.
//

import SwiftUI
import PhotosUI

struct OnboardingView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    @State var goToNext: Bool = false
    @State private var currentOption: Onboarding = .introduction
    @State private var selectedIndex: Int = 0
    private let allPages = Onboarding.allCases
    @AccessibilityFocusState private var restartFocus: FocusField?

    enum FocusField: Hashable {
        case beginning
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                TabView(selection: $currentOption) {
                    ForEach(allPages) { option in
                        VStack(alignment: .center) {
                            ViewThatFits(in: .vertical) {
                                VStack {
                                    Image(option.imageName)
                                        .accessibilityHidden(true)
                                    
                                    Spacer()
                                    
                                    Text(option.title)
                                        .font(Font.custom("Poppins-SemiBold", size: 32))
                                        .padding(.bottom, 8)
                                        .padding(.horizontal, 20)
                                        .multilineTextAlignment(.center)
                                        .lineHeight(.normal)
                                        .accessibilityFocused($restartFocus, equals: .beginning)
                                        

                                    
                                    Text(option.subtitle)
                                        .font(Font.custom("Poppins-Regular", size: 20))
                                        .padding(.bottom, 50)
                                        .padding(.horizontal, 30)
                                        .multilineTextAlignment(.center)

                                }
                                
                                ScrollView (showsIndicators: false){
                                    Image(option.imageName)
                                        .accessibilityHidden(true)
                                    
                                    Spacer()
                                    
                                    Text(option.title)
                                        .font(Font.custom("Poppins-SemiBold", size: 32))
                                        .padding(.bottom, 8)
                                        .multilineTextAlignment(.center)

                                    
                                    Text(option.subtitle)
                                        .font(Font.custom("Poppins-Regular", size: 20))
                                        .padding(.bottom, 50)
                                        .multilineTextAlignment(.center)

                                }
                            }

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
            
            .toolbarVisibility(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if currentOption != .introduction {
                        Button {
                            returnPage()
                            DispatchQueue.main.async{restartFocus = .beginning }
                        } label: {
                            Image(systemName: "chevron.backward")
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            
            if currentOption != .memory {
                Button {
                    advancePage()
                    DispatchQueue.main.async{restartFocus = .beginning }
                } label: {
                    MainButtonView(title: "Continuar")
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 8)

                
                Spacer()
            } else {
                Button {
                    isFirstLaunch = false
                    goToNext = true
                    DispatchQueue.main.async{restartFocus = .beginning }
                } label: {
                    MainButtonView(title: "Concluir")
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 8)

                
                Spacer()
            }
        }.navigationDestination(isPresented: $goToNext) {
            ContentView()
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
    
    private func returnPage() {
        if let currentIndex = allPages.firstIndex(of: currentOption) {
            let nextIndex = currentIndex - 1
            
            if nextIndex < allPages.count {
                currentOption = allPages[nextIndex]
            }
        }
    }
}

#Preview {
    OnboardingView()
}
