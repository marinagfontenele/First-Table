//
//  ThreePicturesTemplateView.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 18/09/26.
//

import SwiftUI

struct ThreePicturesTemplate: View {
    @Bindable var photoSession: PhotoSession
    var body: some View {
        ZStack{
            Image("memoryBackground")
                .resizable()
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .accessibilityHidden(true)
            Image("ollie")
                .rotationEffect(Angle(degrees: -90))
                .offset(x: -49, y: 200)
                .accessibilityHidden(true)
            
            Image("memoryAsset1")
                .offset(x: -75, y: -120)
                .scaleEffect(x:-1)
                .accessibilityHidden(true)
            Image("memoryAsset3")
                .offset(x:50, y: -240)
                .accessibilityHidden(true)
            
            PolaroidFrameTextAtTop(photo: photoSession.results[1])
                .offset(x:-40, y: -190)
            PolaroidFrameTextAtTop(photo: photoSession.results[2])
                .offset(x:40, y: 200)
            PolaroidFrameGroup(photo: photoSession.results[0])
            
            
            Image("memoryAsset2")
                .offset(x: -75, y: -85)
                .accessibilityHidden(true)
            Image("memorySmileFace")
                .offset(x: 75, y: 75)
                .accessibilityHidden(true)
            
            Image("watermark")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .offset(x: 145, y: 305)
                .accessibilityHidden(true)
        }
        .environment(\.dynamicTypeSize, .medium)
    }
}

//#Preview {
//    ThreePicturesTemplate()
//}
