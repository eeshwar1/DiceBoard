//
//  ViewController.swift
//  CustomGeometry
//
//  Created by Venky Venkatakrishnan on 12/28/19.
//  Copyright © 2019 Venky UL. All rights reserved.
//

import Cocoa
import SceneKit

class ViewController: NSViewController {
    
    
    @IBOutlet weak var scnView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = SCNScene()
        
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
        lightNode1.light!.type = .omni
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
        let dieGeometry = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0.0)
        let dieNode = SCNNode(geometry: dieGeometry)
        dieGeometry.firstMaterial?.diffuse.contents = NSColor.red
        dieGeometry.firstMaterial?.transparency = 0.7
        
        dieNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scnView.scene?.rootNode.addChildNode(dieNode)
        
        // side with 1
        
        let dot11Geometry =  SCNCylinder(radius: 1.0, height: 0.1)
        dot11Geometry.firstMaterial?.diffuse.contents = NSColor.white
        
        let dot11Node = SCNNode(geometry: dot11Geometry)
        dot11Node.position = SCNVector3(x: 0, y: 5, z: 0)
        
        dieNode.addChildNode(dot11Node)
        
        // side with 2
        
        let dot21Geometry = SCNCylinder(radius: 1.0, height: 0.1)
    
        dot21Geometry.firstMaterial?.diffuse.contents = NSColor.white
    
        let dot21Node = SCNNode(geometry: dot21Geometry)
      
        dot21Node.position = SCNVector3(x: 2.5, y: 0, z: 5)
        
        dot21Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot21Node)
        
        let dot22Geometry = SCNCylinder(radius: 1.0, height: 0.1)
        
        dot22Geometry.firstMaterial?.diffuse.contents = NSColor.white
        
        let dot22Node = SCNNode(geometry: dot22Geometry)
          
        dot22Node.position = SCNVector3(x: -2.5, y: 0, z: 5)
            
        dot22Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot22Node)

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

