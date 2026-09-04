//
//  GridBackground.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 03/09/26.
//

import SwiftUI

struct GridBackground: View {
    var spacing: CGFloat = 30
    var lineWidth: CGFloat = 1
    
    var body: some View {
        Canvas { context, size in
            
            // bg
            context.fill(
                Path(CGRect(origin: .zero, size: size)),
                with: .color(.bgBlack)
            )
            
            // vertical lines
            var x: CGFloat = 0
            
            while x <= size.width {
                var path = Path()
                path.move(to: CGPoint(x: x, y: 0))
                path.addLine(to: CGPoint(x: x, y: size.height))
                
                context.stroke(
                    path,
                    with: .color(Color(red: 0.247059, green: 0.247059, blue: 0.247059)),
                    lineWidth: lineWidth
                )
                
                x += spacing
            }
            
            // horizontal lines
            var y: CGFloat = 0
            
            while y <= size.height {
                var path = Path()
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: size.width, y: y))
                
                context.stroke(
                    path,
                    with: .color(Color(red: 0.247059, green: 0.247059, blue: 0.247059)),
                    lineWidth: lineWidth
                )
                
                y += spacing
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GridBackground()
}
