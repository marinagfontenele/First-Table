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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Selecione categorias pelas quais o grupo se interessa:")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                            .padding(.horizontal, 20)
                        
                        HStack (spacing: 20){

                            CategoryButtonView(selectedCategory: selected, category: .cooking)
                            
                            CategoryButtonView(selectedCategory: selected, category: .music)
                            
                            CategoryButtonView(selectedCategory: selected, category: .games)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                    
                        HStack (spacing: 20){

                            CategoryButtonView(selectedCategory: selected, category: .movies)
                            
                            CategoryButtonView(selectedCategory: selected, category: .confessions)
                            
                            CategoryButtonView(selectedCategory: selected, category: .chaos)
                        }
                        .padding(.vertical, 0)
                        .padding(.horizontal, 16)
                        
                        HStack (spacing: 20){

                            CategoryButtonView(selectedCategory: selected, category: .decisions)
                            
                            CategoryButtonView(selectedCategory: selected, category: .gossip)
                            
                            CategoryButtonView(selectedCategory: selected, category: .situations)
                        }
                        .padding(.bottom, 40)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        
                        Button {
                            
                        } label: {
                            MainButtonView(title: "Continuar")
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Informações")
    }
}

#Preview {
    CategoryView()
}
