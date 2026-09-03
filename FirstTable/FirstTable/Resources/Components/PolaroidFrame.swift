//
//  PolaroidFrame.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 03/09/26.
//

import SwiftUI

struct PolaroidFrameVertical: View {
    var body: some View {
        ZStack (alignment: .top){
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .fill(Color(red: 0.94, green: 0.94, blue: 0.96))
                .frame(width: 133, height: 200)
                
            
            VStack{
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 115, height: 153)
                    .padding(10)
                Text("O mais gentil")
                    .font(.custom("Poppins-Bold", size: 8))
                    .foregroundStyle(Color.black)
                    
            }
        }
    }
}

struct PolaroidFrameGroup: View {
    var body: some View {
        ZStack (alignment: .bottom){
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .fill(Color(red: 0.94, green: 0.94, blue: 0.96))
                .frame(width: 133, height: 210)
            
            VStack(spacing: 5){
                Text("Os besties")
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 5)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 115, height: 153)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    PolaroidFrameGroup()
}
