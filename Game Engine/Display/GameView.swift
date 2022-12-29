//
//  GameView.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 25/12/2022.
//
import MetalKit

class GameView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        Engine.Ignite(device: device!)
        
        self.clearColor = Preferences.clearColor
        
        self.colorPixelFormat = Preferences.MainPixelFormat
        
        self.renderer = Renderer()
        self.delegate = renderer
    }
}
