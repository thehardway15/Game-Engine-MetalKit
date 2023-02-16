import MetalKit

class Renderer: NSObject {}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // When the window is resized
    }
    
    func draw(in view: MTKView) {
        // draw view
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        SceneManger.TickScene(renderCommandEncoder: renderCommandEncoder!, deltaTime: 1 / Float(view.preferredFramesPerSecond))
        
        // Send info to renderCommandEncoder
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
    
}
