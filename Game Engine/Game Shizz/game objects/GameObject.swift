import MetalKit

class GameObject: Node {
    
    var modelConstants = ModelConstants()
    private var material = Material()
    private var _textureType: TextureTypes = .None
    
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        mesh = Entities.Meshes[meshType]
    }
    
    override func update(){
        updateModelConstants()
        super.update()
    }
    
    private func updateModelConstants(){
        modelConstants.modelMatrix = self.modelMatrix
    }
    
}

extension GameObject: Renderable{
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipelineStates[.Basic])
        renderCommandEncoder.setDepthStencilState(Graphics.DepthStencilStates[.Less])
        
        //Vertex Shader
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
        
        //Fragment Shader
        renderCommandEncoder.setFragmentSamplerState(Graphics.SamplerStates[.Linear], index: 0)
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        if(material.useTexture) {
            renderCommandEncoder.setFragmentTexture(Entities.Textures[_textureType], index: 0)
        }
        
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

//Material Properties
extension GameObject {
    public func setMaterialColor(_ color: float4){
        self.material.color = color
        self.material.useMaterialColor = true
        self.material.useTexture = false
        
    }
    
    public func setTexture(_ textureType: TextureTypes) {
        self._textureType = textureType
        self.material.useTexture = true
        self.material.useMaterialColor = false
    }
    
    // Is Lit
    public func setMaterialIsLit(_ isLit: Bool) { self.material.isLit = isLit }
    public func getMaterialIsLit()->Bool { return self.material.isLit }
    
    // Ambient
    public func setMaterialAmbient(_ ambient: float3) { self.material.ambient = ambient }
    public func setMaterialAmbient(_ ambient: Float) { self.material.ambient = float3(ambient, ambient, ambient) }
    public func addMaterialAmbient(_ value: Float) { self.material.ambient += value }
    public func getMaterialAmbient()->float3 { return self.material.ambient }
    
    // Diffuse
    public func setMaterialDiffuse(_ diffuse: float3) { self.material.diffuse = diffuse }
    public func setMaterialDiffuse(_ diffuse: Float) { self.material.diffuse = float3(diffuse, diffuse, diffuse) }
    public func addMaterialDiffuse(_ value: Float) { self.material.diffuse += value }
    public func getMaterialDiffuse()->float3 { return self.material.diffuse }
    
    // Specular
    public func setMaterialSpecular(_ specular: float3) { self.material.specular = specular }
    public func setMaterialSpecular(_ specular: Float) { self.material.specular = float3(specular, specular, specular) }
    public func addMaterialSpecular(_ value: Float) { self.material.specular += value }
    public func getMaterialSpecular()->float3 { return self.material.specular }
    
    // Shininess
    public func setMaterialShininess(_ shininess: Float) { self.material.shininess = shininess }
    public func getShininess()->Float { return self.material.shininess }
}
