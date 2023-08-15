//
//  OnboardingBubblesScene.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 14/8/23.
//

import Foundation
import SpriteKit

class OnboardingBubblesScene: SKScene, SKPhysicsContactDelegate {
    
    var ball = SKShapeNode(circleOfRadius: 30)
    
    func setUp() {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: .zero, size: size))
        self.physicsWorld.contactDelegate = self
        
        self.backgroundColor = .clear
    }
    
    func displayBalls() {
        ball.fillColor = .systemCyan
        ball.strokeColor = .clear
        
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        ball.physicsBody!.restitution = 0.5
        ball.physicsBody!.friction = 0
        ball.physicsBody!.affectedByGravity = false
        
        self.backgroundColor = .red
        
        self.physicsBody!.categoryBitMask = 0b10
        ball.physicsBody!.categoryBitMask = 0b10
        ball.physicsBody!.contactTestBitMask = 0b10
        
        let symbolTexture = SKTexture(image: UIImage(systemName: "arrow.uturn.backward")!)
        let symbolNode = SKSpriteNode(texture: symbolTexture)
        
        addChild(ball)
        ball.addChild(symbolNode)
        
        let centerRegion = SKShapeNode(circleOfRadius: 25)
        centerRegion.position = CGPoint(x: size.width / 2, y: size.height / 2)
        centerRegion.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        centerRegion.physicsBody!.isDynamic = false
        
        centerRegion.strokeColor = .clear
        
        addChild(centerRegion)
    }
    
    override func didMove(to view: SKView) {
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
}
