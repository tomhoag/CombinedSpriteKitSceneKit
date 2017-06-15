//
//  MainScene.swift
//  CombinedSpriteKitSceneKit
//
//  Created by Davis Allie on 21/05/2015.
//  Copyright (c) 2015 tutsplus. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class MainScene: SCNScene {
    
    var cubeNode: SCNNode!
    var cameraNode: SCNNode!
    var lightNode: SCNNode!
    
    override init() {
        
        super.init()
        
        let cube = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0)
//        let cubeMaterial = SCNMaterial()
//        cubeMaterial.diffuse.contents = UIColor.blue
//        cubeMaterial.normal.contents = "WoodCubeA.jpg"
//        
//        let cM2 = SCNMaterial()
//        cM2.diffuse.contents = UIColor.red
//        cM2.normal.contents = "WoodCubeB.jpg"
//        
//        let cM3 = SCNMaterial()
//        cM2.diffuse.contents = UIColor.yellow
//        cM2.normal.contents = "WoodCubeC.jpg"
//        
//        cube.materials = [cubeMaterial, cM2, cM3]
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green
        greenMaterial.locksAmbientWithDiffuse = true
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents  = "WoodCubeC.jpg"
        redMaterial.locksAmbientWithDiffuse     = true;
        
        let blueMaterial = SCNMaterial()
        blueMaterial.diffuse.contents           = "WoodCubeB.jpg"
        blueMaterial.locksAmbientWithDiffuse    = true;
        
        let yellowMaterial  = SCNMaterial()
        yellowMaterial.diffuse.contents         = UIColor.yellow
        yellowMaterial.locksAmbientWithDiffuse  = true;
        
        let purpleMaterial  = SCNMaterial()
        purpleMaterial.diffuse.contents         = "WoodCubeA.jpg" //UIColor.purple
        purpleMaterial.locksAmbientWithDiffuse  = true;
        
        let magentaMaterial  = SCNMaterial()
        magentaMaterial.diffuse.contents        = UIColor.magenta
        magentaMaterial.locksAmbientWithDiffuse = true;
        
        cube.materials = [greenMaterial,  redMaterial, blueMaterial, yellowMaterial, purpleMaterial, magentaMaterial];
        
        self.cubeNode = SCNNode(geometry: cube)
        self.cubeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0.01, z: 0, duration: 1.0/60.0)))
        
        /*
        super.init()
        
        let cube = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0.25)
        
        let materialScene = SKScene(size: CGSize(width: 100, height: 100))
        let backgroundNode = SKSpriteNode(color: UIColor.blue, size: materialScene.size)
        backgroundNode.position = CGPoint(x: materialScene.size.width/2.0, y: materialScene.size.height/2.0)
        materialScene.addChild(backgroundNode)
        
        let blueAction = SKAction.colorize(with: UIColor.blue, colorBlendFactor: 1, duration: 2.5)
        let redAction = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1, duration: 2.5)
        let greenAction = SKAction.colorize(with: UIColor.green, colorBlendFactor: 1, duration: 2.5)
        backgroundNode.run(SKAction.repeatForever(SKAction.sequence([blueAction, redAction, greenAction])))
        
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = materialScene
        cube.materials = [cubeMaterial]
        self.cubeNode = SCNNode(geometry: cube)
        self.cubeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0.01, z: 0, duration: 1.0/60.0)))
        */
        
//        let material = torus.geometry?.firstMaterial;
//        material?.specular.contents = UIColor(white:0.5, alpha:1.0)
//        material?.shininess = 2.0;
//        material?.normal.contents = "wood-normal.png"
        
        let camera = SCNCamera()
        camera.xFov = 60
        camera.yFov = 60
        
        let ambientLight = SCNLight()
        ambientLight.type = SCNLight.LightType.ambient
        ambientLight.color = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        
        let cameraConstraint = SCNLookAtConstraint(target: self.cubeNode)
        cameraConstraint.isGimbalLockEnabled = true
        
        self.cameraNode = SCNNode()
        self.cameraNode.camera = camera
        self.cameraNode.constraints = [cameraConstraint]
        self.cameraNode.light = ambientLight
        self.cameraNode.position = SCNVector3(x: 5, y: 5, z: 5)
        
        let omniLight = SCNLight()
        omniLight.type = SCNLight.LightType.omni
        
        self.lightNode = SCNNode()
        self.lightNode.light = omniLight
        self.lightNode.position = SCNVector3(x: -3, y: 5, z: 3)
        
        self.rootNode.addChildNode(self.cubeNode)
        self.rootNode.addChildNode(self.cameraNode)
        self.rootNode.addChildNode(self.lightNode)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "paused" {
            self.isPaused = change?[NSKeyValueChangeKey.newKey] as! Bool
        }
    }
    
}
