//
//  MemoryView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 03/09/26.
//

import SwiftUI

struct MemoryFivePicturesView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("memoryBackground")
                    .resizable()
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                ZStack{
                    Image("ollie")
                        .offset(x:-13,y:-328)
                    Image("memoryAsset1")
                        .offset(x: -152, y: -140)
                    Image("memoryAsset3")
                        .offset(x: -100, y: 225)
                    
                    PolaroidFrameGroup()
                        .offset(x:-15, y: -200)
                    PolaroidFrameVertical()
                        .offset(x: 90, y: 150)
                        .rotationEffect(Angle(degrees: 15))
                    PolaroidFrameVertical()
                        .offset(x: 60, y: -25)
                        .rotationEffect(Angle(degrees: 5))
                    PolaroidFrameVertical()
                        .offset(x: -120, y: 105)
                        .rotationEffect(Angle(degrees: -20))
                    PolaroidFrameVertical()
                        .offset(x: -70, y: -35)
                        .rotationEffect(Angle(degrees: -5))
                    
                    Image("memoryAsset2")
                        .offset(x: 100, y: 275)
                    Image("memorySmileFace")
                        .offset(x: 100, y: -115)
                }
                .offset(x: 15, y: 20)
                
            }
            .navigationTitle("Memória")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MemoryThreePicturesView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("memoryBackground")
                    .resizable()
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                Image("ollie")
                    .rotationEffect(Angle(degrees: -90))
                    .offset(x: -49, y: 200)
                
                Image("memoryAsset1")
                    .offset(x: -75, y: -120)
                    .scaleEffect(x:-1)
                Image("memoryAsset3")
                    .offset(x:50, y: -250)
                
                PolaroidFrameGroup()
                    .offset(x:-40, y: -190)
                PolaroidFrameGroup()
                    .offset(x:40, y: 200)
                PolaroidFrameGroup()
                
                
                Image("memoryAsset2")
                    .offset(x: -75, y: -85)
                Image("memorySmileFace")
                    .offset(x: 75, y: 75)
            }
            .navigationTitle("Memória")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MemoryThreePicturesView()
}
