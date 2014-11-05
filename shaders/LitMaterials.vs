#version 330

uniform mat4 Projection = mat4(1);
uniform mat4 ModelView = mat4(1);
uniform vec4 Materials[8];

layout(location = 0) in vec4 Position;
layout(location = 2) in vec3 Normal;
layout(location = 3) in vec4 Color;
layout(location = 4) in float Material;

out vec3 vViewNormal;
out vec4 vViewPosition;
out vec4 vColor;

void main() {
    gl_Position = Projection * ModelView * Position;

    // The normal in view space
    vViewNormal = vec4(ModelView * vec4(Normal.xyz, 0)).xyz;

    // The position in view space
    vViewPosition = ModelView * Position;
    vColor = vec4(Normal, 1);
    vColor.r = Material / 5;
    vColor.g = 0;
    vColor.b = 0;
    vColor = Materials[int(Material) - 1];
}
