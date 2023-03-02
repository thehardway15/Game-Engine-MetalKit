//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

import MetalKit


class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    var cruiser = Cruiser()
    
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(3)
        
        addChild(cruiser)
    }
    
    override func doUpdate() {
        if(Mouse.IsMouseButtonPressed(button: .LEFT)) {
            cruiser.rotateX(Mouse.GetDY() * GameTime.DeltaTime)
            cruiser.rotateY(Mouse.GetDX() * GameTime.DeltaTime)
        }
    }
    
}
