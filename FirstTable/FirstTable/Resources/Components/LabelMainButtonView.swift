//
//  MainButtonView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 31/08/26.
//

import SwiftUI

struct MainButtonView: View {
    @State var title: String = "Título"
    
    var body: some View {
        VStack {
            Text("\(title)")
<<<<<<< HEAD:FirstTable/FirstTable/Resources/Components/MainButtonView.swift
                .font(.custom("Poppins-SemiBold", size: 18))
=======
                .font(.custom("Poppins-SemiBold", size: 24))
              // .fontWeight(.semibold)
>>>>>>> develop:FirstTable/FirstTable/Resources/Components/LabelMainButtonView.swift
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, minHeight: 56)
        .background(.lemonGreen)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    MainButtonView()
}
