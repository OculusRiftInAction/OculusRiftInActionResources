#version 330

uniform mat4 Projection = mat4(1);
uniform mat4 ModelView = mat4(1);
uniform bool InstanceTransformActive = false;

layout(location = 0) in vec4 Position;
layout(location = 2) in vec3 Normal;
layout(location = 3) in vec4 Color;
layout(location = 5) in mat4 InstanceTransform;

out vec3 vViewNormal;
out vec4 vViewPosition;
out vec4 vColor;

void main() {
    mat4 ViewXfm = ModelView;

    if (InstanceTransformActive) {
        ViewXfm = ViewXfm * InstanceTransform;
    }
    
    gl_Position = Projection * ViewXfm * Position;

    // The normal in view space
    vViewNormal = vec4(ViewXfm * vec4(Normal.xyz, 0)).xyz;

    // The position in view space
    vViewPosition = ViewXfm * Position;

    // The vertex color
    vColor = Color;
}
