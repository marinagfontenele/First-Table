//
//  PolaroidFrame.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 03/09/26.
//

import SwiftUI

struct PolaroidFrameTextAtBottom: View {
    
    let photo: PhotoResult
    
    var body: some View {
        ZStack (alignment: .top){
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .fill(Color(red: 0.94, green: 0.94, blue: 0.96))
                .frame(width: 133, height: 200)
                
            
            VStack{
                Image(uiImage: photo.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 115, height: 153)
                    .clipped()
                    .padding(10)
                Text(photo.task.name)
                    .font(.custom("Poppins-Bold", size: 8))
                    .foregroundStyle(Color.black)
                    
            }
        }
    }
}

struct PolaroidFrameTextAtTop: View {
    
    let photo: PhotoResult
    
    var body: some View {
        ZStack (alignment: .bottom){
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .fill(Color(red: 0.94, green: 0.94, blue: 0.96))
                .frame(width: 133, height: 200)
            
            VStack(spacing: 5){
                Text(photo.task.name)
                    .font(.custom("Poppins-Bold", size: 8))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 5)
                Image(uiImage: photo.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 115, height: 153)
                    .clipped()
                    .padding(.bottom, 10)
            }
        }
    }
}

struct PolaroidFrameGroup: View {
    
    let photo: PhotoResult
    
    var body: some View {
        ZStack (alignment: .bottom){
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .fill(Color(red: 0.94, green: 0.94, blue: 0.96))
                .frame(width: 133, height: 210)
            
            VStack(spacing: 5){
                Text(photo.task.name)
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 5)
                Image(uiImage: photo.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 115, height: 153)
                    .clipped()
                    .padding(.bottom, 10)
            }
        }
    }
}

//#Preview {
//    PolaroidFrameGroup()
//}
