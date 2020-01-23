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
    
    var dotRadius: CGFloat = 1.0
    var dotDepth:  CGFloat = 0.1
    
    var size: CGFloat = 10.0 {
        didSet {
            
           
        }
    }
    var color: NSColor = NSColor.red
    var dotColor: NSColor = NSColor.white
    var initialPosition =  SCNVector3(x: 0, y: 0, z: 0)

    
    required init() {
        
    }
   
    
    init(size: CGFloat, color: NSColor, dotColor: NSColor) {
          self.size = size
          self.color = color
          self.dotColor = dotColor
        
          setupDotSize()
        
    }
    
    init(size: CGFloat, color: NSColor, dotColor: NSColor, initialPosition: SCNVector3) {
           self.size = size
           self.color = color
           self.dotColor = dotColor
           self.initialPosition = initialPosition
        
            setupDotSize()
    }
    
    func setupDotSize () {
        
        self.dotRadius = size/10
        self.dotDepth = size/100
    }
    func createNode() -> SCNNode
    {
        
        let dieGeometry = SCNBox(width: size, height: size, length: size, chamferRadius: size/10.0)
        let dieNode = SCNNode(geometry: dieGeometry)
        dieGeometry.firstMaterial?.diffuse.contents = color
        dieGeometry.firstMaterial?.transparency = 0.95
        
        dieNode.position = self.initialPosition
       
        // side with 1
        
        let dot11Node = getDotNode(dotColor: dotColor)
        
        dot11Node.position = SCNVector3(x: 0, y: 0, z: size/2)
        
        dot11Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot11Node)
        
        // side with 2
    
        let dot21Node = getDotNode(dotColor: dotColor)
      
        dot21Node.position = SCNVector3(x: size/4, y: size/2, z: -size/4)
        
        dot21Node.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
        
        dieNode.addChildNode(dot21Node)
    
        
        let dot22Node = getDotNode(dotColor: dotColor)
          
        dot22Node.position = SCNVector3(x: -size/4, y: size/2, z: size/4)
            
        dot22Node.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
        
        dieNode.addChildNode(dot22Node)
        
        // side with 5
          
        let dot51Node = getDotNode(dotColor: dotColor)
            
        dot51Node.position = SCNVector3(x: 0, y: -size/2, z: 0)
              
        dot51Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot51Node)
              
        let dot52Node = getDotNode(dotColor: dotColor)
                
        dot52Node.position = SCNVector3(x: size/4, y: -size/2, z: size/4)
                  
        dot52Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot52Node)
              
        let dot53Node = getDotNode(dotColor: dotColor)
                
        dot53Node.position = SCNVector3(x: -size/4, y: -size/2, z: size/4)
                  
        dot53Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot53Node)
              
        let dot54Node = getDotNode(dotColor: dotColor)
                
        dot54Node.position = SCNVector3(x: size/4, y: -size/2, z: -size/4)
                  
        dot54Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot54Node)
                    
        let dot55Node = getDotNode(dotColor: dotColor)
                      
        dot55Node.position = SCNVector3(x: -size/4, y: -size/2, z: -size/4)
                        
        dot55Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
                    
        dieNode.addChildNode(dot55Node)
        
        
        // side with 6
             
        let dot61Node = getDotNode(dotColor: dotColor)
               
       dot61Node.position = SCNVector3(x: -size/4, y: size/4, z: -size/2)
             
       dot61Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot61Node)
             
       let dot62Node = getDotNode(dotColor: dotColor)
               
       dot62Node.position = SCNVector3(x: -size/4, y: -size/4, z: -size/2)
                 
       dot62Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot62Node)
             
        let dot63Node = getDotNode(dotColor: dotColor)
               
        dot63Node.position = SCNVector3(x: -size/4, y: 0.0, z: -size/2)
                 
       dot63Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot63Node)
             
       let dot64Node = getDotNode(dotColor: dotColor)
               
        dot64Node.position = SCNVector3(x: size/4, y: -size/4, z: -size/2)
                 
       dot64Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot64Node)
                   
       let dot65Node = getDotNode(dotColor: dotColor)
                     
        dot65Node.position = SCNVector3(x: size/4, y: 0.0, z: -size/2)
                       
       dot65Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                   
       dieNode.addChildNode(dot65Node)
        
       let dot66Node = getDotNode(dotColor: dotColor)
                           
        dot66Node.position = SCNVector3(x: size/4, y: size/4, z: -size/2)
                         
        dot66Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                     
        dieNode.addChildNode(dot66Node)
       
        // side with 3
                  
        let dot31Node = getDotNode(dotColor: dotColor)
                
        dot31Node.position = SCNVector3(x: -size/2, y: size/4, z: size/4)
              
        dot31Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot31Node)
        
        let dot32Node = getDotNode(dotColor: dotColor)
                
        dot32Node.position = SCNVector3(x: -size/2, y: 0, z: 0)
              
        dot32Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot32Node)
        
        let dot33Node = getDotNode(dotColor: dotColor)
                
        dot33Node.position = SCNVector3(x: -size/2, y: -size/4, z: -size/4)
              
        dot33Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot33Node)
        
        // side with 4
                        
      let dot41Node = getDotNode(dotColor: dotColor)
              
      dot41Node.position = SCNVector3(x: size/2, y: size/4, z: -size/4)
            
      dot41Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
            
      dieNode.addChildNode(dot41Node)
        
        
        let dot42Node = getDotNode(dotColor: dotColor)
                     
        dot42Node.position = SCNVector3(x: size/2, y: -size/4, z: -size/4)
               
         dot42Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
               
         dieNode.addChildNode(dot42Node)
        
        let dot43Node = getDotNode(dotColor: dotColor)
                           
      dot43Node.position = SCNVector3(x: size/2, y: -size/4, z: size/4)
             
       dot43Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
             
       dieNode.addChildNode(dot43Node)
        
        let dot44Node = getDotNode(dotColor: dotColor)
        
        dot44Node.position = SCNVector3(x: size/2, y: size/4, z: size/4)
              
        dot44Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot44Node)
 
        dieNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
     
        return dieNode
    
    }
    
    func getDotNode(dotColor: NSColor) -> SCNNode
    {
        let dotGeometry =  SCNCylinder(radius: dotRadius, height: dotDepth)
        dotGeometry.firstMaterial?.diffuse.contents = dotColor
              
        let dotNode = SCNNode(geometry: dotGeometry)
        
        return dotNode
    }

}
