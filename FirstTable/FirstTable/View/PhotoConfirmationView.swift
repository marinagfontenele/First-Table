//
//  PhotoConfirmationView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 02/09/26.
//

import SwiftUI

struct PhotoConfirmationView: View {
    let image: UIImage
    let onConfirm: () -> Void
    
    var body: some View {
        VStack (spacing: 20) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .aspectRatio(3.0 / 4.0, contentMode: .fit)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .padding(.bottom, 90)
        .padding(.bottom)
        .navigationTitle("Desafio")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    onConfirm()
                } label: {
                    Image(systemName: "checkmark")
                }
                
            }
        }
    }
}
    

//#Preview {
//    PhotoConfirmationView()
//}
