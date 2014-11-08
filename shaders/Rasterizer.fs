#version 330

uniform sampler2D sampler;

in vec2 vEdge;
in vec2 vTexCoord;

out vec4 FragColor;

float edgeFactor() {
    vec2 d = fwidth(vEdge);
    vec2 a3 = abs(smoothstep(vec2(0.0), d * 1.2, vec2(1) - abs(vEdge)));
    return min(a3.x, a3.y);
}

void main() {
    vec2 vfract = fract(vEdge);
    if (any(lessThan(vfract, vec2(0.15))) || any(greaterThan(vfract, vec2(0.85)))) {
      discard;
    }
    
    //FragColor = vec4(vTexCoord, 0, 1);
    FragColor = texture(sampler, vTexCoord);
    FragColor.a = 1.0;
}