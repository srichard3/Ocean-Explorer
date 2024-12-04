//
//  OEEnemyNode5.swift
//  Ocean Explorer
//
//  Created by Haseeb Garfinkel on 11/24/24.
//

import Foundation
import SpriteKit

class OEEnemyNode5: SKSpriteNode {

    private let gridSize: CGSize
    
    init(gridSize: CGSize) {
        self.gridSize = gridSize
        let texture = SKTexture(imageNamed: "Jellyfish")
        super.init(texture: texture, color: .clear, size: CGSize(width: texture.size().width * 0.4, height: texture.size().height * 0.4))
        
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.affectedByGravity = false // Disable gravity for the enemy
        self.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        self.physicsBody?.collisionBitMask = PhysicsCategory.box
        self.physicsBody?.contactTestBitMask = PhysicsCategory.box
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startMoving(from start: CGPoint, to end: CGPoint, speed: CGFloat) {
        self.position = start

        let moveAction = SKAction.move(to: end, duration: speed)

        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        
        run(sequence)
    }
}