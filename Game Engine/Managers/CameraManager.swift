//
//  CameraManager.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 17/02/2023.
//

class CameraManager {
    
    private var _cameras: [CameraTypes: Camera] = [:]
    
    public var currentCamera: Camera!
    
    public func registerCamera(camera: Camera) {
        self._cameras.updateValue(camera, forKey: camera.cameraType)
    }
    
    public func setCamera(_ cameraType: CameraTypes) {
        self.currentCamera = _cameras[cameraType]
    }
    
    internal func update() {
        for camera in _cameras.values {
            camera.update()
        }
    }
    
}
