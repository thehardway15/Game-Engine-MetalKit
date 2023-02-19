//
//  Library.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 18/02/2023.
//

class Library<T,K> {
    init() {
        fillLibrary()
    }
    
    func fillLibrary() {}
    
    subscript(_ type: T) -> K? {
        return nil
    }
}
