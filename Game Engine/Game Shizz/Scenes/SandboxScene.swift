//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

import MetalKit


class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    var quad = Quad()
    
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(5)
        
        addChild(quad)
    }
    
    override func doUpdate() {
        quad.setPositionX(cos(GameTime.TotalGameTime))
    }
    
}
