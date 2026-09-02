//
//  RoundButtonView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 01/09/26.
//
//

import SwiftUI

enum rounds {
    case five
    case ten
    case fifteen
}

struct RoundButtonView: View {
    @State var selectedRound: rounds? = nil
    @State var buttonRound: rounds? = nil
    
    var body: some View {
        ZStack {
            if (selectedRound == buttonRound) {
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
                    selectedRound = buttonRound
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
}
