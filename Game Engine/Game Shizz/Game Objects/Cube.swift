//
//  Cube.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 17/02/2023.
//

import MetalKit

class Cube: GameObject {
    
    init() {
        super.init(meshType: .Cube_Custom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.x += (Float.randomZeroToOne * deltaTime)
        self.rotation.y += (Float.randomZeroToOne * deltaTime)
        super.update(deltaTime: deltaTime)
    }
    
}
