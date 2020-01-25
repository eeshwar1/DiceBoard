//
//  VUDice.swift
//  CustomGeometry
//
//  Created by Venky Venkatakrishnan on 1/20/20.
//  Copyright © 2020 Venky UL. All rights reserved.
//

import Foundation
import AppKit
import SceneKit

class VUDice {
    
    var pipRadius: CGFloat = 1.0
    var pipDepth:  CGFloat = 0.1
    
    var size: CGFloat = 10.0 {
        didSet {
            
           
        }
    }
    var color: NSColor = NSColor.red
    var pipColor: NSColor = NSColor.white
    var initialPosition =  SCNVector3(x: 0, y: 0, z: 0)
    
    required init() {
        
    }
   
    
    init(size: CGFloat, color: NSColor, pipColor: NSColor) {
          self.size = size
          self.color = color
          self.pipColor = pipColor
        
          setuppipSize()
        
    }
    
    init(size: CGFloat, color: NSColor, pipColor: NSColor, initialPosition: SCNVector3) {
           self.size = size
           self.color = color
           self.pipColor = pipColor
           self.initialPosition = initialPosition
        
            setuppipSize()
    }
    
    func setuppipSize () {
        
        self.pipRadius = size/10
        self.pipDepth = size/100
    }
    func createNode() -> SCNNode
    {
        
        let dieGeometry = SCNBox(width: size, height: size, length: size, chamferRadius: size/10.0)
        let dieNode = SCNNode(geometry: dieGeometry)
        dieGeometry.firstMaterial?.diffuse.contents = color
        dieGeometry.firstMaterial?.transparency = 0.95
        
        dieNode.position = self.initialPosition
    
       
        // side with 1
        
        let pip11Node = getpipNode(pipColor: pipColor)
        
        pip11Node.position = SCNVector3(x: 0, y: 0, z: size/2)
        
        pip11Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(pip11Node)
        
        // side with 2
    
        let pip21Node = getpipNode(pipColor: pipColor)
      
        pip21Node.position = SCNVector3(x: size/4, y: size/2, z: -size/4)
        
        pip21Node.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
        
        dieNode.addChildNode(pip21Node)
    
        
        let pip22Node = getpipNode(pipColor: pipColor)
          
        pip22Node.position = SCNVector3(x: -size/4, y: size/2, z: size/4)
            
        pip22Node.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
        
        dieNode.addChildNode(pip22Node)
        
        // side with 5
          
        let pip51Node = getpipNode(pipColor: pipColor)
            
        pip51Node.position = SCNVector3(x: 0, y: -size/2, z: 0)
              
        pip51Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(pip51Node)
              
        let pip52Node = getpipNode(pipColor: pipColor)
                
        pip52Node.position = SCNVector3(x: size/4, y: -size/2, z: size/4)
                  
        pip52Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(pip52Node)
              
        let pip53Node = getpipNode(pipColor: pipColor)
                
        pip53Node.position = SCNVector3(x: -size/4, y: -size/2, z: size/4)
                  
        pip53Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(pip53Node)
              
        let pip54Node = getpipNode(pipColor: pipColor)
                
        pip54Node.position = SCNVector3(x: size/4, y: -size/2, z: -size/4)
                  
        pip54Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(pip54Node)
                    
        let pip55Node = getpipNode(pipColor: pipColor)
                      
        pip55Node.position = SCNVector3(x: -size/4, y: -size/2, z: -size/4)
                        
        pip55Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
                    
        dieNode.addChildNode(pip55Node)
        
        
        // side with 6
             
        let pip61Node = getpipNode(pipColor: pipColor)
               
       pip61Node.position = SCNVector3(x: -size/4, y: size/4, z: -size/2)
             
       pip61Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(pip61Node)
             
       let pip62Node = getpipNode(pipColor: pipColor)
               
       pip62Node.position = SCNVector3(x: -size/4, y: -size/4, z: -size/2)
                 
       pip62Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(pip62Node)
             
        let pip63Node = getpipNode(pipColor: pipColor)
               
        pip63Node.position = SCNVector3(x: -size/4, y: 0.0, z: -size/2)
                 
       pip63Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(pip63Node)
             
       let pip64Node = getpipNode(pipColor: pipColor)
               
        pip64Node.position = SCNVector3(x: size/4, y: -size/4, z: -size/2)
                 
       pip64Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(pip64Node)
                   
       let pip65Node = getpipNode(pipColor: pipColor)
                     
        pip65Node.position = SCNVector3(x: size/4, y: 0.0, z: -size/2)
                       
       pip65Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                   
       dieNode.addChildNode(pip65Node)
        
       let pip66Node = getpipNode(pipColor: pipColor)
                           
        pip66Node.position = SCNVector3(x: size/4, y: size/4, z: -size/2)
                         
        pip66Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                     
        dieNode.addChildNode(pip66Node)
       
        // side with 3
                  
        let pip31Node = getpipNode(pipColor: pipColor)
                
        pip31Node.position = SCNVector3(x: -size/2, y: size/4, z: size/4)
              
        pip31Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(pip31Node)
        
        let pip32Node = getpipNode(pipColor: pipColor)
                
        pip32Node.position = SCNVector3(x: -size/2, y: 0, z: 0)
              
        pip32Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(pip32Node)
        
        let pip33Node = getpipNode(pipColor: pipColor)
                
        pip33Node.position = SCNVector3(x: -size/2, y: -size/4, z: -size/4)
              
        pip33Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(pip33Node)
        
        // side with 4
                        
      let pip41Node = getpipNode(pipColor: pipColor)
              
      pip41Node.position = SCNVector3(x: size/2, y: size/4, z: -size/4)
            
      pip41Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
            
      dieNode.addChildNode(pip41Node)
        
        
        let pip42Node = getpipNode(pipColor: pipColor)
                     
        pip42Node.position = SCNVector3(x: size/2, y: -size/4, z: -size/4)
               
         pip42Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
               
         dieNode.addChildNode(pip42Node)
        
        let pip43Node = getpipNode(pipColor: pipColor)
                           
       pip43Node.position = SCNVector3(x: size/2, y: -size/4, z: size/4)
             
       pip43Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
             
       dieNode.addChildNode(pip43Node)
        
        let pip44Node = getpipNode(pipColor: pipColor)
        
        pip44Node.position = SCNVector3(x: size/2, y: size/4, z: size/4)
              
        pip44Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(pip44Node)
 
        dieNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
     
        return dieNode
    
    }
    
    func getpipNode(pipColor: NSColor) -> SCNNode
    {
        let pipGeometry =  SCNCylinder(radius: pipRadius, height: pipDepth)
        pipGeometry.firstMaterial?.diffuse.contents = pipColor
              
        let pipNode = SCNNode(geometry: pipGeometry)
        
        return pipNode
    }

}
