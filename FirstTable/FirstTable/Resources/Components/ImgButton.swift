//
//  ImgButton.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import SwiftUI

struct ImgButton: View {
    
    @State var imageName: String = "plus"
    
    var body: some View {
        Image(systemName: "\(imageName)").foregroundStyle(Color.black)
        .font(.custom("Poppins-SemiBold", size: 18))
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 56)
        .background(.lemonGreen)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }}

#Preview {
    ImgButton()
}
