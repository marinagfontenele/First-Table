//
//  CategoryButtonView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 01/09/26.
//

import SwiftUI

struct CategoryButtonView: View {
    @State var selectedCategory: Category? = nil
    let category: Category
    @Binding var selectedCategories: [Category]
    
    var body: some View {
        ZStack {
            if (selectedCategory == category) {
                Button {
                    if let indice = selectedCategories.firstIndex(of: selectedCategory!) {
                        selectedCategories.remove(at: indice)
                    }
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedCategory = nil
                    }
                } label: {
                    VStack {
                        ZStack {
                            Image("whiteCategory")
                            
                            Text("\(category.image)")
                                .padding(.bottom, 10)
                        }
                        .padding(.top, 14)
                        .padding(.bottom, -7)
                        
                        Text("\(category.name)")
                            .font(Font.custom("Poppins-SemiBold", size: 13))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 15)
                            .padding(.bottom, 10)
                            .padding(.top, 5)
                    }
                }
                .frame(maxWidth: 130, minHeight: 109)
                .overlay {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(25)
                )
            } else {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedCategory = category
                    }
                    selectedCategories.append(selectedCategory!)
                } label: {
                    VStack {
                        ZStack {
                            Image("greenCategory")
                            
                            Text("\(category.image)")
                                .padding(.bottom, 10)
                        }
                        .padding(.top, 14)
                        .padding(.bottom, -7)
                        
                        Text("\(category.name)")
                            .font(Font.custom("Poppins-SemiBold", size: 13))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 15)
                            .padding(.bottom, 10)
                            .padding(.top, 5)
                        
                    }
                }
                .frame(maxWidth: 130, minHeight: 109)
                .overlay {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonBackground)
                        .cornerRadius(25)
                )
            }
        }
    }
}


#Preview {
    CategoryButtonView(selectedCategory: .cooking, category: .confessions, selectedCategories: .constant([.cooking, .chaos]))
}
