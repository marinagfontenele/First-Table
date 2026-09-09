//
//  MemoryView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 03/09/26.
//

import SwiftUI

struct MemoryView: View {
    @EnvironmentObject var navigation: NavigationManager
    @State private var shareImage: ShareImage?
    var body: some View {
        if let photoSession = navigation.photoSession{
            VStack{
                if photoSession.totalQuestions == 5 {
                    ThreePicturesTemplate(photoSession: photoSession)
                } else {
                    FivePictureTemplate(photoSession: photoSession)
                }
            }
            .background(Color.bgBlack.ignoresSafeArea())
            .navigationTitle("Memória")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let image: UIImage?
                        if photoSession.totalQuestions == 5 {
                            image = renderView {ThreePicturesTemplate(photoSession: photoSession)}
                        } else {
                            image = renderView {
                                FivePictureTemplate(photoSession: photoSession)
                            }
                        }
                        if let image {
                            shareImage = ShareImage(image: image)
                        }

                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }

                }
            }
            .sheet(item: $shareImage) { item in
                ShareSheet(items: [item.image])
            }
        }
    }
}

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
                Image("memoryAsset1")
                    .offset(x: -152, y: -140)
                Image("memoryAsset3")
                    .offset(x: -115, y: 225)
                
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
                Image("memorySmileFace")
                    .offset(x: 100, y: -115)
                
                Image("watermark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .offset(x: 135, y: 285)
                    
            }
            .offset(x: 15, y: 20)
            
        }
        .navigationTitle("Memória")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ThreePicturesTemplate: View {
    @Bindable var photoSession: PhotoSession
    var body: some View {
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
                .offset(x:50, y: -240)
            
            PolaroidFrameTextAtTop(photo: photoSession.results[1])
                .offset(x:-40, y: -190)
            PolaroidFrameTextAtTop(photo: photoSession.results[2])
                .offset(x:40, y: 200)
            PolaroidFrameGroup(photo: photoSession.results[0])
            
            
            Image("memoryAsset2")
                .offset(x: -75, y: -85)
            Image("memorySmileFace")
                .offset(x: 75, y: 75)
            
            Image("watermark")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .offset(x: 145, y: 305)
        }
        
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}



//#Preview {
//    MemoryThreePicturesView()
//}
