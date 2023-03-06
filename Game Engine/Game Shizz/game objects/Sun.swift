//
//  Sun.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 03/03/2023.
//

import simd

class Sun: LigthObject {
    init() {
        super.init(name: "Sun")
        self.setMaterialColor(float4(0.5, 0.5, 0, 1.0))
        self.setScale(0.3)
    }
}
