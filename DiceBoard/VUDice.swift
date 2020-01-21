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
    
    var size: CGFloat = 10.0
    var color: NSColor = NSColor.red
    var dotColor: NSColor = NSColor.white
    
    required init() {
        
    }
    init(size: CGFloat, color: NSColor, dotColor: NSColor) {
        self.size = size
        self.color = color
        self.dotColor = dotColor
    }
    
    func createNode() -> SCNNode
    {
        
        let dieGeometry = SCNBox(width: size, height: size, length: size, chamferRadius: size/10.0)
        let dieNode = SCNNode(geometry: dieGeometry)
        dieGeometry.firstMaterial?.diffuse.contents = color
        dieGeometry.firstMaterial?.transparency = 0.99
        
        dieNode.position = SCNVector3(x: 10, y: 20, z: 0)
       
        
        // side with 1
        
        let dot11Node = getDotNode(dotColor: dotColor)
        
        dot11Node.position = SCNVector3(x: 0, y: 5, z: 0)
        
        dieNode.addChildNode(dot11Node)
        
        // side with 2
    
        let dot21Node = getDotNode(dotColor: dotColor)
      
        dot21Node.position = SCNVector3(x: 2.5, y: -2.5, z: 5)
        
        dot21Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot21Node)
    
        
        let dot22Node = getDotNode(dotColor: dotColor)
          
        dot22Node.position = SCNVector3(x: -2.5, y: 2.5, z: 5)
            
        dot22Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: 0, z: 0)
        
        dieNode.addChildNode(dot22Node)
        
        // side with 5
          
        let dot51Node = getDotNode(dotColor: dotColor)
            
        dot51Node.position = SCNVector3(x: -2.5, y: -5.0, z: -2.5)
              
        dot51Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot51Node)
              
        let dot52Node = getDotNode(dotColor: dotColor)
                
        dot52Node.position = SCNVector3(x: 2.5, y: -5.0, z: 2.5)
                  
        dot52Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot52Node)
              
        let dot53Node = getDotNode(dotColor: dotColor)
                
        dot53Node.position = SCNVector3(x: -2.5, y: -5.0, z: 2.5)
                  
        dot53Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot53Node)
              
        let dot54Node = getDotNode(dotColor: dotColor)
                
        dot54Node.position = SCNVector3(x: 2.5, y: -5.0, z: -2.5)
                  
        dot54Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
              
        dieNode.addChildNode(dot54Node)
                    
        let dot55Node = getDotNode(dotColor: dotColor)
                      
        dot55Node.position = SCNVector3(x: 0.0, y: -5.0, z: 0.0)
                        
        dot55Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi), y: 0, z: 0)
                    
        dieNode.addChildNode(dot55Node)
        
        
        // side with 6
             
        let dot61Node = getDotNode(dotColor: dotColor)
               
       dot61Node.position = SCNVector3(x: -2.5, y: 2.5, z: -5.0)
             
       dot61Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot61Node)
             
       let dot62Node = getDotNode(dotColor: dotColor)
               
       dot62Node.position = SCNVector3(x: -2.5, y: -2.5, z: -5.0)
                 
       dot62Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot62Node)
             
        let dot63Node = getDotNode(dotColor: dotColor)
               
        dot63Node.position = SCNVector3(x: -2.5, y: 0.0, z: -5.0)
                 
       dot63Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot63Node)
             
       let dot64Node = getDotNode(dotColor: dotColor)
               
        dot64Node.position = SCNVector3(x: 2.5, y: -2.5, z: -5.0)
                 
       dot64Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
             
       dieNode.addChildNode(dot64Node)
                   
       let dot65Node = getDotNode(dotColor: dotColor)
                     
        dot65Node.position = SCNVector3(x: 2.5, y: 0.0, z: -5.0)
                       
       dot65Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                   
       dieNode.addChildNode(dot65Node)
        
       let dot66Node = getDotNode(dotColor: dotColor)
                           
        dot66Node.position = SCNVector3(x: 2.5, y: 2.5, z: -5.0)
                         
        dot66Node.eulerAngles = SCNVector3(x: -CGFloat(Float.pi/2), y: 0, z: 0)
                     
        dieNode.addChildNode(dot66Node)
       
        // side with 3
                  
        let dot31Node = getDotNode(dotColor: dotColor)
                
        dot31Node.position = SCNVector3(x: -5.0, y: 2.5, z: -2.5)
              
        dot31Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot31Node)
        
        let dot32Node = getDotNode(dotColor: dotColor)
                
        dot32Node.position = SCNVector3(x: -5.0, y: 0, z: 0)
              
        dot32Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot32Node)
        
        let dot33Node = getDotNode(dotColor: dotColor)
                
        dot33Node.position = SCNVector3(x: -5.0, y: -2.5, z: 2.5)
              
        dot33Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot33Node)
        
        // side with 4
                        
      let dot41Node = getDotNode(dotColor: dotColor)
              
      dot41Node.position = SCNVector3(x: 5.0, y: 2.5, z: -2.5)
            
      dot41Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
            
      dieNode.addChildNode(dot41Node)
        
        
        let dot42Node = getDotNode(dotColor: dotColor)
                     
        dot42Node.position = SCNVector3(x: 5.0, y: -2.5, z: -2.5)
               
         dot42Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
               
         dieNode.addChildNode(dot42Node)
        
        let dot43Node = getDotNode(dotColor: dotColor)
                           
      dot43Node.position = SCNVector3(x: 5.0, y: -2.5, z: 2.5)
             
       dot43Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
             
       dieNode.addChildNode(dot43Node)
        
        let dot44Node = getDotNode(dotColor: dotColor)
        
        dot44Node.position = SCNVector3(x: 5.0, y: 2.5, z: 2.5)
              
        dot44Node.eulerAngles = SCNVector3(x: CGFloat(Float.pi/2), y: -CGFloat(Float.pi/2) ,z: 0)
              
        dieNode.addChildNode(dot44Node)
 
        dieNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
     
        return dieNode
    
    }
    
    func getDotNode(dotColor: NSColor) -> SCNNode
    {
        let dotGeometry =  SCNCylinder(radius: Constants.dotRadius, height: Constants.dotDepth)
        dotGeometry.firstMaterial?.diffuse.contents = dotColor
              
        let dotNode = SCNNode(geometry: dotGeometry)
        
        return dotNode
    }

}
