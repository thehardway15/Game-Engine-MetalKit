//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    var quad = Quad()
    var sun = Sun()
    
    override func buildScene() {
        debugCamera.setPosition(0, 0, 6)
        addCamera(debugCamera)
        
        sun.setPosition(0, 2, 0)
        sun.setMaterialIsLit(false)
        sun.setLightBrightness(0.3)
        sun.setMaterialColor(1, 1, 1, 1)
        sun.setLightColor(1, 1, 1)
        addLight(sun)
        
        quad.setMaterialAmbient(0.01)
        quad.setMaterialShininess(10)
        quad.setMaterialSpecular(5)
        quad.setTexture(.PartyPirateParrot)
        addChild(quad)
        
    }
    
    override func doUpdate() {
        if(Mouse.IsMouseButtonPressed(button: .LEFT)) {
            quad.rotateX(Mouse.GetDY() * GameTime.DeltaTime)
            quad.rotateY(Mouse.GetDX() * GameTime.DeltaTime)
        }
    }
    
}
