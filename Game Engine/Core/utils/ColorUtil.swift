//
//  ColorUtil.swift
//  Game Engine
//
//  Created by Damian Wiśniewski on 18/02/2023.
//
import simd

class ColorUtil {
    public static var randomColor: float4 {
        return float4(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1.0)
    }
}
