//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

import MetalKit


class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    var cube = Cube()
    
    override func buildScene() {
        
        addCamera(debugCamera)
        
        debugCamera.position.z = 5
        
        addChild(cube)
        
//        let count: Int = 5
//
//        for y in -count..<count {
//            for x in -count..<count {
//                let pointer = Pointer(camera: debugCamera)
//                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
//                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
//                pointer.scale = float3(0.1)
//                addChild(pointer)
//            }
//        }
        
    }
    
    override func update(deltaTime: Float) {
        cube.rotation.x += deltaTime
        cube.rotation.y += deltaTime
        super.update(deltaTime: deltaTime)
        
    }
}
