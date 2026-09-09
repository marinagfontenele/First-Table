//
//  PhotoConfirmationView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 02/09/26.
//

import SwiftUI

struct PhotoConfirmationView: View {
    @EnvironmentObject var navigation: NavigationManager
    @State private var scale: CGFloat = 0.6
    
    var body: some View {
        let modelService = navigation.modelService
        if let image = navigation.capturedImage,
        let photoSession = navigation.photoSession{
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
                        photoSession.saveCurrentPhoto(image)
                        
                        let finishedQuestions = photoSession.currentQuestion >= photoSession.totalQuestions
                        let finishedPhotos = photoSession.isLastPhoto
                        
                        if !finishedPhotos {
                            photoSession.goToNextPhoto()
                        }
                        if finishedQuestions && finishedPhotos {
                            navigation.navigate(to: .memory)
                        } else {
                            navigation.navigate(to: .question)
                        }
                    } label: {
                        Image(systemName: "checkmark")
                    }
        }
            }
        }
    }
}
    

//#Preview {
//    PhotoConfirmationView()
//}
