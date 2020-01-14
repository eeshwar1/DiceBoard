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
    
    static let dotRadius: CGFloat = 1.0
    static let dotDepth:  CGFloat = 0.1
}
class ViewController: NSViewController {
    
    
    @IBOutlet weak var scnView: SCNView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        let scene = SCNScene()
        
        var ground = SCNNode()
        
       let groundGeometry = SCNFloor()
        groundGeometry.reflectivity = 0.9
       let groundMaterial = SCNMaterial()
       groundMaterial.diffuse.contents = NSColor.gray
       groundGeometry.materials = [groundMaterial]
       ground = SCNNode(geometry: groundGeometry)
        
        scene.rootNode.addChildNode(ground)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
      
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add lights to the scene
        
        let lightNode0 = SCNNode()
        lightNode0.light =  SCNLight()
        lightNode0.light!.type = .omni
        lightNode0.position =  SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode0)
        
        let lightNode1 = SCNNode()
        lightNode1.light =  SCNLight()
        lightNode1.light!.type = .ambient
        lightNode1.position =  SCNVector3(x: 5, y: -10, z: 0)
        scene.rootNode.addChildNode(lightNode1)
        
        scnView.scene = scene
        
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = NSColor.black
            /*
        createOctahedron(origin: (0.0,0.0,0.0), size: 5.0)
        */
        createDie()
        
       /*
        let boxGeometry = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0.0)
        let boxNode = SCNNode(geometry: boxGeometry)
        boxGeometry.firstMaterial?.diffuse.contents = NSColor.red
        boxGeometry.firstMaterial?.transparency = 0.7
        boxNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(boxNode)
        
        let rotateAction = SCNAction.repeatForever(SCNAction.rotateBy(x: -.pi, y: .pi, z: 0, duration: 5))
        
        boxNode.runAction(rotateAction) */
        
    }

    func createDie()
    {
        
        let dieGeometry = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
        let dieNode = SCNNode(geometry: dieGeometry)
        dieGeometry.firstMaterial?.diffuse.contents = NSColor.red
        dieGeometry.firstMaterial?.transparency = 0.99
        
        dieNode.position = SCNVector3(x: 0, y: 10, z: 0)
        scnView.scene?.rootNode.addChildNode(dieNode)
        
        // side with 1
        
        let dot11Node = getDotNode()
        
        dot11Node.position = SCNVector3(x: 0, y: 5, z: 0)
        
        dieNode.addChildNode(dot11Node)
        
        // side with 2
    
        let dot21Node = getDotNode()
      
        dot21Node.position = SCNVector3(x: 2.5, y: -2.5, z: 5)
        
        dot21Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot21Node)
    
        
        let dot22Node = getDotNode()
          
        dot22Node.position = SCNVector3(x: -2.5, y: 2.5, z: 5)
            
        dot22Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot22Node)
        
        // side with 5
          
        let dot51Node = getDotNode()
            
        dot51Node.position = SCNVector3(x: -2.5, y: -5.0, z: -2.5)
              
        dot51Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot51Node)
              
        let dot52Node = getDotNode()
                
        dot52Node.position = SCNVector3(x: 2.5, y: -5.0, z: 2.5)
                  
        dot52Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot52Node)
              
        let dot53Node = getDotNode()
                
        dot53Node.position = SCNVector3(x: -2.5, y: -5.0, z: 2.5)
                  
        dot53Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot53Node)
              
        let dot54Node = getDotNode()
                
        dot54Node.position = SCNVector3(x: 2.5, y: -5.0, z: -2.5)
                  
        dot54Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot54Node)
                    
        let dot55Node = getDotNode()
                      
        dot55Node.position = SCNVector3(x: 0.0, y: -5.0, z: 0.0)
                        
        dot55Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
                    
        dieNode.addChildNode(dot55Node)
        
        
        // side with 6
             
     let dot61Node = getDotNode()
               
       dot61Node.position = SCNVector3(x: -2.5, y: 2.5, z: -5.0)
             
       dot61Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot61Node)
             
       let dot62Node = getDotNode()
               
       dot62Node.position = SCNVector3(x: -2.5, y: -2.5, z: -5.0)
                 
       dot62Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot62Node)
             
       let dot63Node = getDotNode()
               
        dot63Node.position = SCNVector3(x: -2.5, y: 0.0, z: -5.0)
                 
       dot63Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot63Node)
             
       let dot64Node = getDotNode()
               
        dot64Node.position = SCNVector3(x: 2.5, y: -2.5, z: -5.0)
                 
       dot64Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot64Node)
                   
       let dot65Node = getDotNode()
                     
        dot65Node.position = SCNVector3(x: 2.5, y: 0.0, z: -5.0)
                       
       dot65Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                   
       dieNode.addChildNode(dot65Node)
        
       let dot66Node = getDotNode()
                           
        dot66Node.position = SCNVector3(x: 2.5, y: 2.5, z: -5.0)
                         
        dot66Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                     
        dieNode.addChildNode(dot66Node)
       
        // side with 3
                  
        let dot31Node = getDotNode()
                
        dot31Node.position = SCNVector3(x: -5.0, y: 2.5, z: -2.5)
              
        dot31Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot31Node)
        
        let dot32Node = getDotNode()
                
        dot32Node.position = SCNVector3(x: -5.0, y: 0, z: 0)
              
        dot32Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot32Node)
        
        let dot33Node = getDotNode()
                
        dot33Node.position = SCNVector3(x: -5.0, y: -2.5, z: 2.5)
              
        dot33Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot33Node)
        
        // side with 4
                        
      let dot41Node = getDotNode()
              
      dot41Node.position = SCNVector3(x: 5.0, y: 2.5, z: -2.5)
            
      dot41Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
            
      dieNode.addChildNode(dot41Node)
        
        
        let dot42Node = getDotNode()
                     
        dot42Node.position = SCNVector3(x: 5.0, y: -2.5, z: -2.5)
               
         dot42Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
               
         dieNode.addChildNode(dot42Node)
        
        let dot43Node = getDotNode()
                           
      dot43Node.position = SCNVector3(x: 5.0, y: -2.5, z: 2.5)
             
       dot43Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
             
       dieNode.addChildNode(dot43Node)
        
        let dot44Node = getDotNode()
        
        dot44Node.position = SCNVector3(x: 5.0, y: 2.5, z: 2.5)
              
        dot44Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot44Node)

        
       // let rotateAction = SCNAction.repeatForever(SCNAction.rotateBy(x: -.pi, y: .pi, z: 0, duration: 5))
               
        //dieNode.runAction(rotateAction)
        
        dieNode.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        dieNode.physicsBody?.isAffectedByGravity = true
        
      
       
       /* let randomX = Float.random(in: 100...200)
        let randomY = Float.random(in: 100...200)
               
       let force = SCNVector3(x: CGFloat(randomX), y: CGFloat(randomY), z: 0)
       
       let position = SCNVector3(x: 1, y: 10, z: 1)
       
       dieNode.physicsBody?.applyForce(force, at: position, asImpulse: true) */

    }
    
    
    func getDotNode() -> SCNNode
    {
        let dotGeometry =  SCNCylinder(radius: Constants.dotRadius, height: Constants.dotDepth)
        dotGeometry.firstMaterial?.diffuse.contents = NSColor.white
              
        let dotNode = SCNNode(geometry: dotGeometry)
        
        return dotNode
    }
    func createOctahedron(origin: (x: Double, y: Double, z: Double), size: Double)
    {
        
        /*
        let vertices: [SCNVector3] = [
            SCNVector3(0, 1, 0),
            SCNVector3(-0.5, 0, 0.5),
            SCNVector3(0.5, 0, 0.5),
            SCNVector3(0.5, 0, -0.5),
            SCNVector3(-0.5, 0, -0.5),
            SCNVector3(0, -1, 0)
            
        ]
        */
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
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

