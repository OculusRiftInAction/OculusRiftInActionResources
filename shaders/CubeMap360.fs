#version 330

uniform sampler2D image360;

in vec3 texCoord;
out vec4 fragColor;

const float PI = 3.14159265359;
const float TAU = 6.28318530718;

void main (void) {
    vec2 tex;
    vec3 norm = normalize(texCoord);
    tex.y = acos(norm.y) / PI;
    tex.x = atan(norm.x, norm.z) / PI;
    tex.x += 1.0;
    tex.x /= 2.0;
    fragColor = texture(image360, tex);
}