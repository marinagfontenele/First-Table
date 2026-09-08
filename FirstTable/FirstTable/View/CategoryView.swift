//
//  CategoryView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 01/09/26.
//

import SwiftUI

struct CategoryView: View {
    @State var name: String = ""
    @State var selected: Category? = nil
    @State var categories: [Category] = []
    @State var description: String = ""
    let totalQuestion: Int
    let groupName: String
    @Bindable var photoSession: PhotoSession
    
    var body: some View {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Selecione categorias pelas quais o grupo se interessa:")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                        
                        HStack (spacing: 20){

                            CategoryButtonView(selectedCategory: selected, category: .cooking, selectedCategories: $categories)
                            
                            CategoryButtonView(selectedCategory: selected, category: .music, selectedCategories: $categories)
                            
                            CategoryButtonView(selectedCategory: selected, category: .games, selectedCategories: $categories)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                    
                        HStack (spacing: 20){

                            CategoryButtonView(selectedCategory: selected, category: .movies, selectedCategories: $categories)
                            
                            CategoryButtonView(selectedCategory: selected, category: .confessions, selectedCategories: $categories)
                            
                            CategoryButtonView(selectedCategory: selected, category: .chaos, selectedCategories: $categories)
                        }
                        .padding(.vertical, 0)
                        .padding(.horizontal, 16)
                        
                        HStack (spacing: 20){

                            CategoryButtonView(selectedCategory: selected, category: .decisions, selectedCategories: $categories)
                            
                            CategoryButtonView(selectedCategory: selected, category: .gossip, selectedCategories: $categories)
                            
                            CategoryButtonView(selectedCategory: selected, category: .situations, selectedCategories: $categories)
                        }
                        .padding(.bottom, 40)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        
                        NavigationLink {
                            LoadingView(totalQuestion: photoSession.totalQuestions, categories: categories, description: description, photoSession: photoSession)
                        } label: {
                            MainButtonView(title: "Continuar")
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        
                        Spacer()
                    }
                    .onAppear{
                        if !photoSession.hasStarted{
                            photoSession.start(totalQuestions: totalQuestion, firstTaskName: groupName)
                        }
                    }
                    
                }
            }
            .background(Color.bgBlack.ignoresSafeArea())
            .navigationTitle("Informações")
    }
}

//#Preview {
//    CategoryView(totalQuestion: 5)
//}
