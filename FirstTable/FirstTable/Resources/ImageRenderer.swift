//
//  ImageRenderer.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 08/09/26.
//

import SwiftUI

func renderView<Content: View>(
    width: CGFloat = 450,
    @ViewBuilder content: () -> Content
)-> UIImage?{
    let height = width * 16/9
    let renderer = ImageRenderer(
        content: content()
            .frame(width: width, height: height),
    )
    renderer.proposedSize = ProposedViewSize(width: width, height: height)
    renderer.scale = 3
    return renderer.uiImage
}

struct ShareImage: Identifiable {
    let id = UUID()
    let image: UIImage
}
