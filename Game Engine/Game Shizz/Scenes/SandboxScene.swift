//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

import MetalKit


class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    
    override func buildScene() {
        
        addCamera(debugCamera)
        debugCamera.position.z = 100
        addCubes()
    }
    
    var cubeCollection1: CubeCollection!
    func addCubes() {
        cubeCollection1 = CubeCollection(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
        addChild(cubeCollection1)
    }
    
    override func update(deltaTime: Float) {
        cubeCollection1.rotation.z += deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
