//
//  OllieView.swift
//  WSymbol
//
//  Created by Tainara Nascimento on 02/09/26.
//

import SwiftUI

struct EyePosition {
    var x: CGFloat = 0
}

struct OllieView: View {
    
    let yEyes: CGFloat
    
    var body: some View {
            
            KeyframeAnimator(
                initialValue: EyePosition(),
                repeating: true
            ) { value in
                
                ZStack {
                    
                    // Corpo
                    Ellipse()
                        .fill(Color(red: 0.93, green: 0.25, blue: 0.45))
                        .frame(width: 262.22, height: 245)
                    
                    // Olho esquerdo
                    Circle()
                        .fill(.white)
                        .frame(width: 61.52, height: 61.52)
                        .offset(
                            x: -34.515,
                            y: -66.815
                        )
                    
                    // Olho direito
                    Circle()
                        .fill(.white)
                        .frame(width: 61.52, height: 61.52)
                        .offset(
                            x: 33.48,
                            y: -66.815
                        )
                    
                    // Pupila esquerda
                    Ellipse()
                        .fill(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .frame(width: 38.315, height: 35.83)
                        .offset(
                            x: -33.95 + value.x,
                            y: -73.585 + yEyes
                        )
                    
                    // Pupila direita
                    Ellipse()
                        .fill(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .frame(width: 38.315, height: 35.83)
                        .offset(
                            x: 33.455 + value.x,
                            y: -73.585 + yEyes
                        )
                }
                .frame(width: 262.22, height: 245)
                
            } keyframes: { _ in
                
                KeyframeTrack(\.x) {
                    LinearKeyframe(0, duration: 0)
                    LinearKeyframe(6.5, duration: 0.511)
                    LinearKeyframe(0, duration: 0.491)
                    LinearKeyframe(-5.5, duration: 0.498)
                    LinearKeyframe(0, duration: 0.508)
                }
            }
        }
    
}

#Preview {
    OllieView(yEyes: 0)
}
