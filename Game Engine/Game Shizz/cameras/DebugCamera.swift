//
//  DebugCamera.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 17/02/2023.
//

import simd


class DebugCamera: Camera {
    
    override var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(degreesFov: 45.0,
                                           aspectRatio: Renderer.AspectRatio,
                                           near: 0.1,
                                           far: 1000)
    }
    
    init() {
        super.init(name: "Debug", cameraType: .Debug)
    }

    override func doUpdate() {
        if (Mouse.IsMouseButtonPressed(button: .RIGHT)) {
            self.rotate(Mouse.GetDY() * GameTime.DeltaTime, Mouse.GetDX() * GameTime.DeltaTime, 0)
        }
        
        if (Mouse.IsMouseButtonPressed(button: .CENTER)) {
            self.rotate(-Mouse.GetDX() * GameTime.DeltaTime, Mouse.GetDY() * GameTime.DeltaTime, 0)
        }
        
        self.moveZ(-Mouse.GetDWheel() * 0.1)
    }
}
