//
//  OEEnemyNode.swift
//  Ocean Explorer
//
//  Created by Alexander Chakmakian on 11/4/24.
//

import SpriteKit

class OEEnemyNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "Enemy")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "enemy"
        
        // Set up physics body without gravity
        self.physicsBody = SKPhysicsBody(texture: texture, size: size)
        self.physicsBody?.isDynamic = false // No gravity, static movement
        self.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        self.physicsBody?.contactTestBitMask = PhysicsCategory.box
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Start moving the enemy from right to left
    func startMoving(from startPoint: CGPoint, to endPoint: CGPoint) {
        self.position = startPoint
        
        let moveAction = SKAction.move(to: endPoint, duration: 5.0) // Adjust duration as needed
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        
        self.run(sequence)
    }
}

