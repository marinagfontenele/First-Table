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
    @State private var scale: CGFloat = 0.6
    
    var body: some View {
        ZStack{
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
            
            OllieView(yEyes: 0)
                .scaleEffect(scale)
                .frame(width: 262.22*scale, height: 245*scale)
                .offset(x:75,y:385)
        }
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
