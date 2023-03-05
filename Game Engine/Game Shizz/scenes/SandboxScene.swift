//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    var cruiser = Cruiser()
    
    var leftSun = Sun()
    var middleSun = Sun()
    var rightSun = Sun()
    
    override func buildScene() {
        debugCamera.setPosition(0, 0, 6)
        addCamera(debugCamera)
        
        leftSun.setPosition(-2, 2, 0)
        leftSun.setMaterialIsLit(false)
        leftSun.setMaterialColor(1, 0, 0, 1)
        leftSun.setLightColor(1, 0, 0)
        leftSun.setScale(0.2)
        addLight(leftSun)
        
        middleSun.setPosition(0, 2, 0)
        middleSun.setLightBrightness(0.3)
        middleSun.setMaterialIsLit(false)
        middleSun.setMaterialColor(1, 1, 1, 1)
        middleSun.setLightColor(1, 1, 1)
        middleSun.setScale(0.2)
        addLight(middleSun)
        
        rightSun.setPosition(2, 2, 0)
        rightSun.setMaterialIsLit(false)
        rightSun.setMaterialColor(0, 0, 1, 1)
        rightSun.setLightColor(0, 0, 1)
        rightSun.setScale(0.2)
        addLight(rightSun)

        cruiser.setMaterialAmbient(0.01)
        cruiser.setRotationX(0.3)
        addChild(cruiser)
    }
    
    override func doUpdate() {
        if(Mouse.IsMouseButtonPressed(button: .LEFT)) {
            cruiser.rotateX(Mouse.GetDY() * GameTime.DeltaTime)
            cruiser.rotateY(Mouse.GetDX() * GameTime.DeltaTime)
        }
        
        cruiser.setMaterialShininess(cruiser.getShininess() + Mouse.GetDWheel())
    }
    
}
