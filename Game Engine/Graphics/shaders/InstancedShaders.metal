//
//  InstancedShaders.metal
//  Game Engine
//
//  Created by Damian Wiśniewski on 19/02/2023.
//

#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

vertex RasterizerData instanced_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                              constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                              constant ModelConstants *modelConstants [[ buffer(2) ]],
                                              uint instancedId [[ instance_id ]]) {
    
    RasterizerData rd;
    
    ModelConstants modelConstant = modelConstants[instancedId];
    
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstant.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    return rd;
}