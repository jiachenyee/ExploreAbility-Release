//
//  ArcText.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 12/6/23.
//

import Foundation
import UIKit
import SwiftUI

struct ArcText: UIViewRepresentable {
    
    var angle: CGFloat = 1.6
    var clockwise = true
    
    var text: String
    var fontSize: Double
    
    func makeUIView(context: Context) -> CircularLabel {
        let label = CircularLabel()
        label.text = text
        label.angle = angle
        label.clockwise = clockwise
        
        return label
    }
    
    func updateUIView(_ uiView: CircularLabel, context: Context) {
        
        uiView.font = .systemFont(ofSize: fontSize)
        uiView.text = text
    }
}
