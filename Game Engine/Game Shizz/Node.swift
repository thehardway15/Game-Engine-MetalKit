import MetalKit

class Node {
    
    var position: float3 = float3(0)
    var scale: float3 = float3(1)
    var roration: float3 = float3(0)
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        
        modelMatrix.translate(direction: position)
        modelMatrix.rotate(angle: roration.x, axis: X_AXIS)
        modelMatrix.rotate(angle: roration.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: roration.z, axis: Z_AXIS)
        modelMatrix.scale(axis: scale)
        
        return modelMatrix
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
        
    }
    
}
