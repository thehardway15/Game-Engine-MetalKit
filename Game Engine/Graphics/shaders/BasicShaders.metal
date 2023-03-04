//
//  BasicShaders.metal
//  Game Engine
//
//  Created by Damian Wiśniewski on 19/02/2023.
//

#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                          constant ModelConstants &modelConstants [[ buffer(2) ]]) {
    
    RasterizerData rd;
    
    float4 worldPosition = modelConstants.modelMatrix * float4(vIn.position, 1);
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * worldPosition;
    rd.color = vIn.color;
    rd.textureCoordinate = vIn.textureCoordinate;
    rd.totalGameTime = sceneConstants.totalGameTime;
    rd.worldPosition = worldPosition.xyz;
    rd.surfaceNormal = (modelConstants.modelMatrix * float4(vIn.normal, 1.0)).xyz;
    rd.toCameraVector = sceneConstants.cameraPosition - worldPosition.xyz;
    
    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]],
                                     constant int &lightCount [[ buffer(2) ]],
                                     constant LightData *lightDatas [[ buffer(3) ]],
                                     sampler sampler2d [[ sampler(0) ]],
                                     texture2d<float> texture [[ texture(0) ]]) {
    
    float2 texCoord = rd.textureCoordinate;
    float4 color;
    
    if(material.useTexture) {
        color = texture.sample(sampler2d, texCoord);
    } else if(material.useMaterialColor) {
        color = material.color;
    } else {
        color = rd.color;
    }
    
    // Lighting
    
    if(material.isLit) {
        float3 unitNormal = normalize(rd.surfaceNormal);
        float3 unitToCameraVector = normalize(rd.toCameraVector);
        
        float3 totalAmbient = float3(0, 0, 0);
        float3 totalDiffuse = float3(0, 0, 0);
        float3 totalSpecular = float3(0, 0, 0);
        
        for(int i = 0; i < lightCount; i++) {
            LightData lightData = lightDatas[i];
            float3 unitToLightVector = normalize(lightData.position - rd.worldPosition); // world pos ---> light pos
            float3 unitReflectionVector = normalize(reflect(-unitToLightVector, unitNormal));
            
            // Ambient Lighting
            float3 ambientness = material.ambient * lightData.ambientIntensity;
            float3 ambientColor = clamp(ambientness * lightData.color * lightData.brightness, 0.0, 1.0);
            totalAmbient += ambientColor;
            
            // Diffuse Lighting
            float3 diffuseness = material.diffuse * lightData.difuesIntensity;
            float nDotL = max(dot(unitNormal, unitToLightVector), 0.0);
            float3 diffuseColor = clamp(diffuseness * nDotL * lightData.color * lightData.brightness, 0.0, 1.0);
            totalDiffuse += diffuseColor;
            
            // Specular Lighting
            float3 specularness = material.specular * lightData.specularIntensity;
            float rDotV = max(dot(unitReflectionVector, unitToLightVector), 0.0);
            float specularExp = pow(rDotV, material.shininess);
            float3 specularColor = clamp(specularness * specularExp * lightData.color * lightData.brightness, 0.0, 1.0);
            totalSpecular += specularColor;
        }
        
        float3 phongIntensity = totalAmbient + totalDiffuse + totalSpecular;
        color *= float4(phongIntensity, 1.0);
    }
    
    return half4(color.r, color.g, color.b, color.a);
}
