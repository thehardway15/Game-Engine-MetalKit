import MetalKit

public enum ClearColors {
    static let White: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let Green: MTLClearColor = MTLClearColor(red: 0.22, green: 0.55, blue: 0.34, alpha: 1.0)
    static let Gray: MTLClearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    static let Black: MTLClearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1.0)
}

class Preferences {
    
    public static var clearColor: MTLClearColor = ClearColors.White
    
    public static var MainPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
}
