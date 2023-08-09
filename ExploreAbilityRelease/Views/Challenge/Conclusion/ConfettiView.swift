//
//  ConfettiView.swift
//  Confetti
//
//  Created by Jia Chen Yee on 23/10/22.
//

import Foundation
import SwiftUI

struct ConfettiView: UIViewRepresentable {
    
    var size: CGSize
    
    func makeUIView(context: Context) -> some UIView {
        let confettiView = ConfettiUIView(frame: .init(origin: .zero, size: size))
        
        confettiView.intensity = 1
        
        confettiView.isUserInteractionEnabled = false
        
        confettiView.alpha = 0.5
        confettiView.startConfetti()
        
        return confettiView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
