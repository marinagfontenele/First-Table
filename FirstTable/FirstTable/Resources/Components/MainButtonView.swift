//
//  MainButtonView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 31/08/26.
//

import SwiftUI

struct MainButtonView: View {
    @State var title: String = "Hello, world!"
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.custom("Poppins-semibold", size: 18))
                .fontWeight(.semibold)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 56)
        .background(.lemonGreen)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    MainButtonView()
}
