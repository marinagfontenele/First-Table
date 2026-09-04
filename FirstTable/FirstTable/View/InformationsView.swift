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
    @State private var showError = false
    @State private var goToDescription = false
    
    
    @FocusState private var isNameFieldFocused: Bool
    
    var body: some View {
            ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                          
                            VStack{
                                Text("Nome do Grupo")
                                    .font(Font.custom("Poppins-SemiBold", size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 15)
                                
                                TextField("Ex: Os Besties", text: $name)
                                    .font(Font.custom("Poppins-SemiBold", size: 15))
                                    .foregroundStyle(.white)
                                    .padding(15)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .stroke(showError && name.trimmingCharacters(in:
                                                    .whitespacesAndNewlines).isEmpty ? .red : Color.lemonGreen, lineWidth: 2)
                                    }
                                    .background(
                                        Color(.lemonBackground)
                                    )
                                    .focused($isNameFieldFocused)
                                    .padding(.horizontal, 20)
                                
                                if showError && name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    Text("Digite um nome para o grupo")
                                        .font(.custom("Poppins-SemiBold", size: 13))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(.red)
                                        .padding(.horizontal, 20)
                                }
                            }
                            .padding(.bottom, 20)
                        
                        HStack{
                            Text("Número de Perguntas")
                                .font(Font.custom("Poppins-SemiBold", size: 20))
                                .padding(.horizontal, 20)
                            
                        }
                            
                            VStack  {
                                
                                HStack {
                                    
                                    fiveButton
                                    
                                    Spacer(minLength: 2)
                                    
                                    tenButton
                                    
                                    Spacer(minLength: 2)
                                    
                                    fifteenButton
                                }
                                .padding(.bottom, 5)
                                
                                if showError && selectedRound == nil {
                                    
                                    Text("Selecione o número de rodadas.")
                                        .font(.custom("Poppins-SemiBold", size: 13))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(.red)
                                        .padding(.horizontal, 20)
                                }
                            }
                        
                        .padding(.bottom, 5)
                        
                       
                        
                        Button {
                            validateAndContinue()
                            } label: {
                                
                                MainButtonView(title: "Continuar")
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 25)
                     
                        
                        Spacer()
                        
                        OllieView(yEyes: 0.02)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .offset(y:100)
                            .scaleEffect(2)
                    }
                }
            }
            .background(Color.bgBlack.ignoresSafeArea())

            .onTapGesture {
                isNameFieldFocused = false
            }
            .navigationDestination(isPresented: $goToDescription) {
                DescriptionView()
            }
        
        .navigationTitle("Informações")
    }
    
    private func validateAndContinue() {
        let nameIsEmpty = name
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .isEmpty
        
        let roundIsEmpty = selectedRound == nil
        
        if nameIsEmpty || roundIsEmpty {
            showError = true
            isNameFieldFocused = nameIsEmpty
            
        } else {
            showError = false
            isNameFieldFocused = false
            goToDescription = true }
        
    }
    
    var fiveButton: some View {
        ZStack {
            if (selectedRound == .five) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedRound = nil
                        isNameFieldFocused = false

                    }
                } label: {
                    Text("05")
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 25)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(20)
                )
                .padding(.leading, 20)
            } else {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedRound = .five
                        isNameFieldFocused = false
                    }
                } label: {
                    Text("05")
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 25)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(20)
                        .opacity(0.12)
                )
                .padding(.leading, 20)
            }
        }
    }
    
    var tenButton: some View {
        ZStack {
            if (selectedRound == .ten) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedRound = nil
                        isNameFieldFocused = false

                    }
                } label: {
                    Text("10")
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 25)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(20)
                )
            } else {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedRound = .ten
                        isNameFieldFocused = false

                    }
                } label: {
                    Text("10")
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 25)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonBackground)
                        .cornerRadius(20)
                )
            }
        }
    }
    
    var fifteenButton: some View {
        ZStack {
            if (selectedRound == .fifteen) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedRound = nil
                        isNameFieldFocused = false

                    }
                } label: {
                    Text("15")
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 25)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonGreen)
                        .cornerRadius(20)
                )
                .padding(.trailing, 20)
            } else {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedRound = .fifteen
                        isNameFieldFocused = false

                    }
                } label: {
                    Text("15")
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 25)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(.lemonGreen), lineWidth: 2)
                }
                .background(
                    Color(.lemonBackground)
                        .cornerRadius(20)
                    
                )
                .padding(.trailing, 20)
            }
        }
    }
    
}

#Preview {
    InformationsView()
}
