//
//  ViewController.swift
//  CustomGeometry
//
//  Created by Venky Venkatakrishnan on 12/28/19.
//  Copyright © 2019 Venky UL. All rights reserved.
//

import Cocoa
import SceneKit

struct Constants {
    
    static let dieColors : [(dieColor: NSColor, pipColor: NSColor)] =
        [(NSColor.red, NSColor.white),
         (NSColor.yellow, NSColor.black),
         (NSColor.purple, NSColor.white),
         (NSColor.green, NSColor.white),
         (NSColor.blue, NSColor.white),
         (NSColor.gray, NSColor.white)
    ]
}


class ViewController: NSViewController {
    
    
    @IBOutlet weak var scnView: SCNView!
    
    @IBOutlet weak var clickRecognizer: NSClickGestureRecognizer!
    
    var dieNodes: [SCNNode] = []
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        let scene = SCNScene()
        
        
        var ground = SCNNode()
        
        scnView.autoenablesDefaultLighting =  true
        
       let groundGeometry = SCNFloor()
        groundGeometry.reflectivity = 0.2
       let groundMaterial = SCNMaterial()
        groundMaterial.diffuse.contents = NSColor.gray
       groundGeometry.materials = [groundMaterial]
       ground = SCNNode(geometry: groundGeometry)
       ground.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        
        
        scene.rootNode.addChildNode(ground)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
      
        cameraNode.position = SCNVector3(x: 0, y: 120, z: 0)
        cameraNode.look(at: SCNVector3(x: 0, y: 0, z: 0))
        cameraNode.camera?.zFar = 120
        cameraNode.camera?.zNear = 10
        
        
        // create and add lights to the scene
      
        
        let lightNode1 = SCNNode()
        
        let spotLight1 =  SCNLight()
        spotLight1.type = .spot
        spotLight1.color = NSColor.white
        spotLight1.spotInnerAngle = 0
        spotLight1.spotOuterAngle = 180
        spotLight1.intensity = 5_000
        spotLight1.castsShadow = true
        spotLight1.doubleSided = true
        
        lightNode1.light = spotLight1
        lightNode1.position = SCNVector3(x: 0, y: 100, z: 0)
        scene.rootNode.addChildNode(lightNode1)
       
        
        let lightNode2 = SCNNode()
        
        let spotLight2 = SCNLight()
        spotLight2.type = .spot
        spotLight2.spotInnerAngle = 0
        spotLight2.spotOuterAngle = 180
        spotLight2.intensity = 5_000
        spotLight2.color = NSColor.white
        spotLight2.castsShadow = true
        lightNode2.light = spotLight2
        lightNode2.position = SCNVector3(x: 200, y: 100, z: 100)
        scene.rootNode.addChildNode(lightNode2)
        
        
        let lightNode3 = SCNNode()
        
        let omniLight1 = SCNLight()
        omniLight1.type = .omni
        lightNode3.light = omniLight1
        lightNode3.position = SCNVector3(x: 0, y: 100, z: 100)
        scene.rootNode.addChildNode(lightNode3)
        
        scnView.scene = scene
        
        scnView.allowsCameraControl = true
        //scnView.showsStatistics = true
        scnView.backgroundColor = NSColor.darkGray
        
        let boardNode = createBoard(length: 200, width: 100, height: 30)
       
        
        scnView.scene?.rootNode.addChildNode(boardNode)
        
        let redDie = VUDice(size: 10.0, color: NSColor.red, pipColor: NSColor.white)
        let blueDie = VUDice(size: 10.0, color: NSColor.blue, pipColor: NSColor.white)
        let greenDie = VUDice(size: 10.0, color: NSColor.green, pipColor: NSColor.white)
        let yellowDie = VUDice(size: 10.0, color: NSColor.yellow, pipColor: NSColor.black)
        
        
            
        
        
                
        dieNodes = [redDie.createNode(), blueDie.createNode(), greenDie.createNode(), yellowDie.createNode()]
        
        // dieNodes.append(redDie.createNode())
        for node in dieNodes {
            
            scnView.scene?.rootNode.addChildNode(node)
        }
        
      
        for dieColor in Constants.dieColors {
            print("Die Color: \(dieColor.dieColor) pipColor: \(dieColor.pipColor)")
        }
      
    }

    
    func throwDie()
    {
        let colorCombo = Constants.dieColors[Int.random(in: 0...Constants.dieColors.count-1)]
        let dieNode = VUDice(size: 10.0, color: colorCombo.dieColor, pipColor: colorCombo.pipColor, initialPosition: SCNVector3(x: 40, y: 10, z: -100)).createNode()
        
        let force = SCNVector3(x: CGFloat(Float.random(in: -10...10)),y: CGFloat(Float.random(in: -40...10)), z: CGFloat(Float.random(in: 10...40)))
        scnView.scene?.rootNode.addChildNode(dieNode)
        dieNode.physicsBody?.applyForce(force, at: SCNVector3(x: 10, y: 10, z: 10), asImpulse: true)
    }
    
    func createOctahedron(origin: (x: Double, y: Double, z: Double), size: Double)
    {
        
        let vertices1: [SCNVector3] = [
            SCNVector3(origin.x, origin.y + size, origin.z),
            SCNVector3(origin.x - size/2, origin.y, origin.z + size/2),
            SCNVector3(origin.x + size/2, origin.y, origin.z + size/2),
            SCNVector3(origin.x + size/2, origin.y, origin.z - size/2),
            SCNVector3(origin.x - size/2, origin.y, origin.z - size/2),
            SCNVector3(origin.x, origin.y - size, origin.z)
            
        ]
        
        let source = SCNGeometrySource(vertices: vertices1)
        
        // Create surfaces
        
        let indices: [UInt16] = [
            0, 1, 2,
            2, 3, 0,
            3, 4, 0,
            4, 1, 0,
            1, 5, 2,
            2, 5, 3,
            3, 5, 4,
            4, 5, 1
            
        ]
        
        let element = SCNGeometryElement(indices: indices, primitiveType: .triangles)
        
        let geometry = SCNGeometry(sources: [source], elements: [element])
        
        let node = SCNNode(geometry: geometry)
        
        
        scnView.scene?.rootNode.addChildNode(node)
        
        let rotateAction = SCNAction.repeatForever(SCNAction.rotateBy(x: .pi, y: .pi, z: 0, duration: 5))
        node.runAction(rotateAction)
        
    }
    
    func createBoard(length: CGFloat, width: CGFloat, height: CGFloat) -> SCNNode
    {
        
        let boardColor = NSColor.brown
        let frameColor = NSColor.init(calibratedRed: 0.5, green: 0.2, blue: 0, alpha: 1.0)
        
        let frameWidth = height/4
        
        let origin = SCNVector3(x: 0, y: 0, z: 0)
        
        let boardBaseGeometry = SCNBox(width: width, height: frameWidth, length: length, chamferRadius: 0)
        boardBaseGeometry.firstMaterial?.diffuse.contents = boardColor
        boardBaseGeometry.firstMaterial?.shininess = 0.5
        let boardNode = SCNNode(geometry: boardBaseGeometry)
        boardNode.position = SCNVector3(x: origin.x, y: origin.y, z: origin.z)
        
        boardNode.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        
        
        let boardWall1Geometry = SCNBox(width: length, height: frameWidth, length: height, chamferRadius: 0)
        boardWall1Geometry.firstMaterial?.diffuse.contents = frameColor
        let boardWall1Node = SCNNode(geometry: boardWall1Geometry)
        boardWall1Node.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        boardWall1Node.position = SCNVector3(x: origin.x - width / 2, y: origin.y, z: origin.z)
        boardWall1Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2) , y: CGFloat(Float.pi/2) ,z: 0)
        boardNode.addChildNode(boardWall1Node)
                       
        let boardWall2Geometry = SCNBox(width: length, height: frameWidth, length: height, chamferRadius: 0)
        boardWall2Geometry.firstMaterial?.diffuse.contents = frameColor
           let boardWall2Node = SCNNode(geometry: boardWall2Geometry)
           boardWall2Node.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        boardWall2Node.position = SCNVector3(x: origin.x + width/2, y: origin.y, z: origin.z)
           boardWall2Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2) , y: CGFloat(Float.pi/2) ,z: 0)
           boardNode.addChildNode(boardWall2Node)
        
        let boardWall3Geometry = SCNBox(width: length/2 + frameWidth, height: frameWidth, length: height, chamferRadius: 0)
        boardWall3Geometry.firstMaterial?.diffuse.contents = frameColor
         let boardWall3Node = SCNNode(geometry: boardWall3Geometry)
         boardWall3Node.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        boardWall3Node.position = SCNVector3(x: origin.x, y: origin.y, z: origin.z - length/2 - height/10)
         boardWall3Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2) , y: 0,z: 0)
         boardNode.addChildNode(boardWall3Node)
        
        let boardWall4Geometry = SCNBox(width: length/2 + frameWidth, height: frameWidth, length: height, chamferRadius: 0)
         boardWall4Geometry.firstMaterial?.diffuse.contents = frameColor
          let boardWall4Node = SCNNode(geometry: boardWall4Geometry)
          boardWall4Node.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        boardWall4Node.position = SCNVector3(x: origin.x, y: origin.y, z: origin.z +  length/2 + height/10)
          boardWall4Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2) , y: 0,z: 0)
          boardNode.addChildNode(boardWall4Node)
               
        
         return boardNode
        
        
    }
    
    func applyForce(node: SCNNode) {
        
        let randomX = Float.random(in: -10...15)
        let randomY = Float.random(in: 0...5)
        let randomZ = Float.random(in: -10...15)
       
                
        let force = SCNVector3(x: CGFloat(randomX), y: CGFloat(randomY), z: CGFloat(randomZ))
        
        let position = SCNVector3(x: 5, y: 5, z: 5)
        
        node.physicsBody?.applyForce(force, at: position, asImpulse: true)

    }
    
    @IBAction func applyForceClicked(sender: NSButton) {
    
        
        for node in dieNodes {
            applyForce(node: node)
        }
        
    }
    
    
    @IBAction func resetDice(sender: NSButton) {
    
        
        for node in dieNodes {
            node.position = SCNVector3(x: 0, y: 0, z: 0)
        }
        
    }
    
    @IBAction func throwDieIn(sender: NSButton) {
       
          throwDie()
           
    }

}

