//
//  ShakeToUndoScene.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import CoreMotion
import SpriteKit

class ShakeToUndoScene: SKScene, SKPhysicsContactDelegate {
    
    let motionManager = CMMotionManager()
    var ball = SKShapeNode(circleOfRadius: 30)
    
    override func didMove(to view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: .zero, size: size))
        
        self.physicsWorld.contactDelegate = self
        
        self.backgroundColor = .clear
        
        ball.fillColor = .systemCyan
        ball.strokeColor = .clear
        
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        ball.physicsBody!.restitution = 0.5
        ball.physicsBody!.friction = 0
        ball.physicsBody!.affectedByGravity = false
        
        self.physicsBody!.categoryBitMask = 0b10
        ball.physicsBody!.categoryBitMask = 0b10
        ball.physicsBody!.contactTestBitMask = 0b10
        
        let symbolTexture = SKTexture(image: UIImage(systemName: "arrow.uturn.backward")!)
        let symbolNode = SKSpriteNode(texture: symbolTexture)
        
        addChild(ball)
        ball.addChild(symbolNode)
        
        motionManager.startAccelerometerUpdates()
        
        let centerRegion = SKShapeNode(circleOfRadius: 25)
        centerRegion.position = CGPoint(x: size.width / 2, y: size.height / 2)
        centerRegion.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        centerRegion.physicsBody!.isDynamic = false
        
        centerRegion.strokeColor = .clear
        
        addChild(centerRegion)
    }
    func didBegin(_ contact: SKPhysicsContact) {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if let accelerometerData = motionManager.accelerometerData {
            let acceleration = accelerometerData.acceleration
            let force = CGVector(dx: acceleration.x * 1000, dy: acceleration.y * 1000)
            ball.physicsBody?.applyForce(force)
        }
    }
    
    override func willMove(from view: SKView) {
        motionManager.stopAccelerometerUpdates()
    }
    
}
