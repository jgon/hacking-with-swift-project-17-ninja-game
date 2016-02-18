//
//  GameScene.swift
//  Project17
//
//  Created by Jacques on 18/02/16.
//  Copyright (c) 2016 J4SOFT. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameScore: SKLabelNode!
    
    var score: Int = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    var liveImages = [SKSpriteNode]()
    var lives = 3
    
    var activeSliceBG: SKShapeNode!
    var activeSliceFG: SKShapeNode!
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "sliceBackground")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .Replace
        background.zPosition = -1
        addChild(background)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        physicsWorld.speed = 0.85
        
        createStore()
        createLives()
        createSlices()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func createStore() {
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.fontSize = 48
        gameScore.text = "Score: 0"
        gameScore.horizontalAlignmentMode = .Left
        
        addChild(gameScore)
        gameScore.position = CGPoint(x: 8, y: 8)
    }
    
    func createLives() {
        for count in 0..<3 {
            let liveNode = SKSpriteNode(imageNamed: "sliceLife")
            liveNode.position = CGPoint(x: CGFloat(834 + (count * 70)), y: 720)
            addChild(liveNode)
            liveImages.append(liveNode)
        }
    }
    
    func createSlices() {
        activeSliceBG = SKShapeNode()
        activeSliceBG.zPosition = 2
        activeSliceBG.strokeColor = UIColor(red: 1, green: 0.9, blue: 0, alpha: 1)
        activeSliceBG.lineWidth = 9
        addChild(activeSliceBG)

        activeSliceFG = SKShapeNode()
        activeSliceFG.zPosition = 2
        activeSliceFG.strokeColor = UIColor.whiteColor()
        activeSliceFG.lineWidth = 5
        addChild(activeSliceFG)
    }
}
