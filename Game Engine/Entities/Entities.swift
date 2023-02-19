//
//  Entities.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 18/02/2023.
//

class Entities {
    private static var _meshLibrary: MeshLibrary!
    public static var Meshes: MeshLibrary { return _meshLibrary }
    
    public static func Initialize() {
        self._meshLibrary = MeshLibrary()
    }
}
