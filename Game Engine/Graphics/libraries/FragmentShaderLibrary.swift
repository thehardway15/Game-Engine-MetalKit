//
//  FragmentShaderLibrary.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 19/02/2023.
//

import MetalKit

enum FragmentShaderTypes {
    case Basic
}

class FragmentShaderLibrary: Library<FragmentShaderTypes, MTLFunction> {
    
    private var _library: [FragmentShaderTypes: Shader] = [:]
    
    override func fillLibrary() {
        _library.updateValue(Shader(name: "Basic Fragment Shader", functionName: "basic_fragment_shader"), forKey: .Basic)
    }
    
    override subscript(type: FragmentShaderTypes) -> MTLFunction {
        return (_library[type]?.function)!
    }
}
