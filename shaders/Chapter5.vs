#version 330

uniform mat4 Projection = mat4(1);
uniform mat4 ModelView = mat4(1);
uniform bool FadeToWhite = false;

layout(location = 0) in vec4 Position;
layout(location = 2) in vec3 Normal;
layout(location = 3) in vec4 Color;
layout(location = 5) in mat4 InstanceTransform;

const vec4 FADE = vec4(0.8, 0.8, 0.8, 1);

out vec3 vViewNormal;
out vec4 vViewPosition;
out vec3 vModelPosition;
out vec4 vColor;

void main() {
    mat4 ViewXfm = ModelView * InstanceTransform;
    
    gl_Position = Projection * ViewXfm * Position;

    // The normal in view space
    vViewNormal = vec4(ViewXfm * vec4(Normal.xyz, 0)).xyz;

    // The position in view space
    vViewPosition = ViewXfm * Position;

    // The position in the original model
    vModelPosition = Position.xyz;

    // The vertex color
    vColor = FadeToWhite ? mix(Color, FADE, 0.25) : Color;
}
