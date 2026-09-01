//
//  SpeechBubble.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import Foundation
import SwiftUI

struct SpeechBubble: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let cornerRadius: CGFloat = 16
        let tailHeight: CGFloat = 50

        // balloon body
        let bubbleRect = CGRect(
            x: rect.minX,
            y: rect.minY + tailHeight,
            width: rect.width,
            height: rect.height - tailHeight
        )

        // roundedcorner
        path.addRoundedRect(
            in: bubbleRect,
            cornerSize: CGSize(
                width: cornerRadius,
                height: cornerRadius
            )
        )

        // balloon tip
        
        path.move(
            to: CGPoint(
                x: bubbleRect.minX + 220, // start base
                y: bubbleRect.minY
            )
        )

        path.addLine(
            to: CGPoint(
                x: bubbleRect.minX + 300, // placement
                y: rect.minY
            )
        )

        path.addLine(
            to: CGPoint(
                x: bubbleRect.minX + 290, // end base
                y: bubbleRect.minY
            )
        )

        path.closeSubpath()

        return path
    }
}
