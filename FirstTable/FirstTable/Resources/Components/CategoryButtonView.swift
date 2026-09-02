//
//  CategoryButtonView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 01/09/26.
//

import SwiftUI

struct CategoryButtonView: View {
    @State var selectedCategory: Category? = nil
    @State var category: Category? = nil
    
    var body: some View {
        ZStack {
            if (selectedCategory == category) {
                Button {
                    selectedCategory = nil
                } label: {
                    VStack {
                        ZStack {
                            Image("whiteCategory")
                            
                            Text("\(category!.image)")
                                .padding(.bottom, 10)
                        }
                        .padding(.top, 14)
                        .padding(.bottom, -7)
                        
                        Text("\(category!.name)")
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
                    selectedCategory = category
                } label: {
                    VStack {
                        ZStack {
                            Image("greenCategory")
                            
                            Text("\(category!.image)")
                                .padding(.bottom, 10)
                        }
                        .padding(.top, 14)
                        .padding(.bottom, -7)
                        
                        Text("\(category!.name)")
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

//func CategoryButtonView(category: Category, name: String, image: Image?) -> some View {
//    var selectedCategory: Category? = nil
//
//    ZStack {
//        if (selectedCategory == category) {
//            Button {
//                selectedCategory = nil
//            } label: {
//                Text("05")
//                    .font(Font.custom("Poppins-SemiBold", size: 24))
//                    .foregroundStyle(.black)
//                    .padding(.horizontal, 21)
//                    .padding(.vertical, 14)
//            }
//            .overlay {
//                RoundedRectangle(cornerRadius: 8, style: .continuous)
//                    .stroke(Color(.lemonGreen), lineWidth: 2)
//            }
//            .background(
//                Color(.lemonGreen)
//                    .cornerRadius(8)
//            )
//            .padding(.leading, 23)
//        } else {
//            Button {
//                selectedCategory = category
//            } label: {
//                Text("05")
//                    .font(Font.custom("Poppins-SemiBold", size: 24))
//                    .foregroundStyle(.white)
//                    .padding(.horizontal, 21)
//                    .padding(.vertical, 14)
//            }
//            .overlay {
//                RoundedRectangle(cornerRadius: 8, style: .continuous)
//                    .stroke(Color(.lemonGreen), lineWidth: 2)
//            }
//            .background(
//                Color(.lemonGreen)
//                    .opacity(0.12)
//            )
//            .padding(.leading, 23)
//        }
//    }
//}



#Preview {
    CategoryButtonView(selectedCategory: .cooking, category: .confessions)
}
