//
//  informationsView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 31/08/26.
//

import SwiftUI

struct InformationsView: View {
    @State var name: String = ""
    @State var selectedRound: rounds? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Nome do Grupo")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                            .padding(.horizontal, 20)
                        
                        TextField("Ex: Os Besties", text: $name)
                            .font(Font.custom("Poppins-SemiBold", size: 15))
                            .foregroundStyle(.white)
                            .padding(15)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Color(.lemonGreen), lineWidth: 2)
                            }
                            .background(
                                Color(.lemonBackground)
                            )
                            .padding(.bottom, 28)
                            .padding(.horizontal, 20)
                        
                        Text("Número de Rodadas")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                            .padding(.horizontal, 20)
                        
                        HStack {
                            
                            fiveButton
                            
                            Spacer(minLength: 2)
                            
                            tenButton
                            
                            Spacer(minLength: 2)
                            
                            fifteenButton
                        }
                        .padding(.bottom, 40)
                        .padding(.vertical, 8)
                        
                        NavigationLink {
                            DescriptionView()
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
    
    var fiveButton: some View {
        ZStack {
            if (selectedRound == .five) {
                Button {
                    selectedRound = nil
                } label: {
                    Text("05")
                        .font(Font.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 14)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(8)
                )
                .padding(.leading, 23)
            } else {
                Button {
                    selectedRound = .five
                } label: {
                    Text("05")
                        .font(Font.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 14)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .opacity(0.12)
                )
                .padding(.leading, 23)
            }
        }
    }
    
    var tenButton: some View {
        ZStack {
            if (selectedRound == .ten) {
                Button {
                    selectedRound = nil
                } label: {
                    Text("10")
                        .font(Font.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 14)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(8)
                )
            } else {
                Button {
                    selectedRound = .ten
                } label: {
                    Text("10")
                        .font(Font.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 14)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonBackground)
                )
            }
        }
    }

    var fifteenButton: some View {
        ZStack {
            if (selectedRound == .fifteen) {
                Button {
                    selectedRound = nil
                } label: {
                    Text("15")
                        .font(Font.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 14)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(8)
                )
                .padding(.trailing, 23)
            } else {
                Button {
                    selectedRound = .fifteen
                } label: {
                    Text("15")
                        .font(Font.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 14)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonBackground)
                )
                .padding(.trailing, 23)
            }
        }
    }

}

#Preview {
    InformationsView()
}
