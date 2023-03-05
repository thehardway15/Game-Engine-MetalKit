//
//  Cruiser.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 02/03/2023.
//

import MetalKit

class Cruiser: GameObject {
    init() {
        super.init(name: "Cruiser", meshType: .Cruiser)
        setTexture(.Cruiser)
    }
}
