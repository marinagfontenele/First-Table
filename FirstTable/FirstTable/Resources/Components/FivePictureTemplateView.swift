//
//  Untitled.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 18/09/26.
//

import SwiftUI

struct FivePictureTemplate: View {
    @Bindable var photoSession: PhotoSession
    var body: some View {
        ZStack{
            Image("memoryBackground")
                .resizable()
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            ZStack{
                Image("ollie")
                    .offset(x:-13,y:-328)
                    .accessibilityHidden(true)
                Image("memoryAsset1")
                    .offset(x: -152, y: -140)
                    .accessibilityHidden(true)
                Image("memoryAsset3")
                    .offset(x: -115, y: 225)
                    .accessibilityHidden(true)
                
                PolaroidFrameGroup(photo: photoSession.results[0])
                    .offset(x:-15, y: -200)
                PolaroidFrameTextAtBottom(photo: photoSession.results[1])
                    .offset(x: 90, y: 125)
                    .rotationEffect(Angle(degrees: 15))
                PolaroidFrameTextAtBottom(photo: photoSession.results[2])
                    .offset(x: 60, y: -25)
                    .rotationEffect(Angle(degrees: 5))
                PolaroidFrameTextAtBottom(photo: photoSession.results[3])
                    .offset(x: -105, y: 125)
                    .rotationEffect(Angle(degrees: -5))
                PolaroidFrameTextAtBottom(photo: photoSession.results[4])
                    .offset(x: -70, y: -35)
                    .rotationEffect(Angle(degrees: -5))
                
                Image("memoryAsset2")
                    .offset(x: 90, y: 250)
                    .accessibilityHidden(true)
                Image("memorySmileFace")
                    .offset(x: 100, y: -115)
                    .accessibilityHidden(true)
                
                Image("watermark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .offset(x: 135, y: 285)
                    .accessibilityHidden(true)
                    
            }
            .offset(x: 15, y: 20)
            
        }
        .environment(\.dynamicTypeSize, .medium)
        .navigationTitle("Memória")
        .navigationBarTitleDisplayMode(.inline)
    }
}
