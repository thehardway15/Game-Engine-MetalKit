//
//  SceneManager.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 16/02/2023.
//

import MetalKit

enum SceneTypes {
    case Sandbox
}

class SceneManger {
    
    private static var _currentScene: Scene!
    
    public static func Initialize(_ sceneType: SceneTypes) {
        SetScene(sceneType)
    }
    
    public static func SetScene(_ sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            _currentScene = SandboxScene(name: "Sandbox")
        }
    }
    
    public static func TickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        GameTime.UpdateTime(deltaTime)
        _currentScene.updateCameras()
        _currentScene.update()
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
    
}
