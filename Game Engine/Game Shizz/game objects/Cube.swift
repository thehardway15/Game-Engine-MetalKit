//
//  Cube.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 17/02/2023.
//

import MetalKit

class Cube: GameObject {
    
    init() {
        super.init(name: "Cube", meshType: .Cube_Custom)
    }
    
    override func doUpdate() {
        self.rotateX(GameTime.DeltaTime)
        self.rotateY(GameTime.DeltaTime)
    }
    
}
