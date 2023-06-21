//
//  CircularLabel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 12/6/23.
//

import Foundation
import UIKit

class CircularLabel: UILabel {
    var angle: CGFloat = 1.6
    var clockwise: Bool = true
    
    override func draw(_ rect: CGRect) {
        centreArcPerpendicular()
    }
    
    func centreArcPerpendicular() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let string = text ?? ""
        let size   = bounds.size
        context.translateBy(x: size.width / 2, y: size.height / 2)
        
        let radius = getRadiusForLabel()
        let length = string.count
        let attributes = [NSAttributedString.Key.font: self.font!]
        
        let characters: [String] = string.map { String($0) }
        var arcs: [CGFloat] = []
        var totalArc: CGFloat = 0
        
        for charIndex in 0 ..< length {
            arcs += [chordToArc(characters[charIndex].size(withAttributes: attributes).width, radius: radius)]
            totalArc += arcs[charIndex]
        }
        
        let direction: CGFloat = clockwise ? -1 : 1
        let slantCorrection = clockwise ? -CGFloat.pi/2 : CGFloat.pi/2
        
        var thetaI = angle - direction * totalArc / 2
        
        for charIndex in 0 ..< length {
            thetaI += direction * arcs[charIndex] / 2
            centre(text: characters[charIndex],
                   context: context,
                   radius: radius,
                   angle: thetaI,
                   slantAngle: thetaI + slantCorrection)
            thetaI += direction * arcs[charIndex] / 2
        }
    }
    
    func chordToArc(_ chord: CGFloat, radius: CGFloat) -> CGFloat {
        return 2 * asin(chord / (2 * radius))
    }
    
    func centre(text str: String, context: CGContext, radius: CGFloat, angle theta: CGFloat, slantAngle: CGFloat) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: textColor!,
            NSAttributedString.Key.font: font!
        ]
        
        context.saveGState()
        
        context.translateBy(x: radius * cos(theta), y: -(radius * sin(theta)))
        
        context.rotate(by: -slantAngle)
        
        let offset = str.size(withAttributes: attributes)
        
        context.translateBy(x: -offset.width / 2, y: -offset.height / 2)
        str.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        
        context.restoreGState()
    }
    
    func getRadiusForLabel() -> CGFloat {
        let smallestWidthOrHeight = min(bounds.size.height, bounds.size.width)
        let heightOfFont = text?.size(withAttributes: [NSAttributedString.Key.font: font!]).height ?? 0
        
        return (smallestWidthOrHeight/2) - heightOfFont + 5
    }
}
