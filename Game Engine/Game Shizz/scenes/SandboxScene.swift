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
    
    var leftSun = Sun()
    var middleSun = Sun()
    var rightSun = Sun()
    
    override func buildScene() {
        debugCamera.setPosition(float3(0, 0, 6))
        addCamera(debugCamera)
        
        leftSun.setPosition(float3(-2, 2, 0))
        leftSun.setMaterialIsLit(false)
        leftSun.setMaterialColor(float4(1, 0, 0, 1))
        leftSun.setLightColor(float3(1, 0, 0))
        leftSun.setScale(0.2)
        addLight(leftSun)
        
        middleSun.setPosition(float3(0, 2, 0))
        middleSun.setLightBrightness(0.3)
        middleSun.setMaterialIsLit(false)
        middleSun.setMaterialColor(float4(1, 1, 1, 1))
        middleSun.setLightColor(float3(1, 1, 1))
        middleSun.setScale(0.2)
        addLight(middleSun)
        
        rightSun.setPosition(float3(2, 2, 0))
        rightSun.setMaterialIsLit(false)
        rightSun.setMaterialColor(float4(0, 0, 1, 1))
        rightSun.setLightColor(float3(0, 0, 1))
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
        
        leftSun.setPositionX(cos(GameTime.TotalGameTime) - 1)
        middleSun.setPositionX(cos(GameTime.TotalGameTime))
        rightSun.setPositionX(cos(GameTime.TotalGameTime) + 1)
        
        cruiser.setMaterialShininess(max(cruiser.getShininess() + cos(GameTime.TotalGameTime) * 5, 1))
    }
    
}
