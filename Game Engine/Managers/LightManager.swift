//
//  LightManager.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 03/03/2023.
//

import MetalKit

class LightManager {
    private var _lightObjects: [LigthObject] = []
    
    func addLightObject(_ lightObject: LigthObject) {
        self._lightObjects.append(lightObject)
    }
    
    private func gatherLightData() -> [LightData] {
        var result: [LightData] = []
        for lightObject in _lightObjects {
            result.append(lightObject.lightData)
        }
        return result
    }
    
    func setLightData(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        var lightDatas = gatherLightData()
        var lightCount = lightDatas.count
        renderCommandEncoder.setFragmentBytes(&lightCount, length: Int32.size, index: 2)
        renderCommandEncoder.setFragmentBytes(&lightDatas, length: LightData.stride(lightCount), index: 3)
    }
}
