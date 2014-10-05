#version 330

uniform vec2 EyeToSourceUVScale = vec2(1.0);
uniform vec2 EyeToSourceUVOffset = vec2(0.0);

uniform sampler2D Texture0;
uniform bool samples = false;

in vec4 oColor;
in vec2 oTanEyeAngle;
in vec2 oTexCoord0;
out vec4 FragColor;
vec2 delta = fwidth(oTanEyeAngle);

vec2 tanEyeAngleToTexture(vec2 v) {
   vec2 result =  v * EyeToSourceUVScale + EyeToSourceUVOffset;
   result.y = 1.0 - result.y;
   return result; 
}

void main()
{
    vec3 color = textureLod(Texture0, oTexCoord0, 0.0).rgb;
    float count = 1.0;
    if (samples && any(greaterThan(delta, vec2(0.005)))) {
        vec2 texSample1 = tanEyeAngleToTexture(oTanEyeAngle * 0.998);
        color += textureLod(Texture0, texSample1, 0.0).rgb;
        vec2 texSample2 = tanEyeAngleToTexture(oTanEyeAngle * 1.002); 
        color += textureLod(Texture0, texSample2, 0.0).rgb;
        count = count + 2.0;
    } 
    if (samples && any(greaterThan(delta, vec2(0.010)))) {
        vec2 texSample1 = oTanEyeAngle;
        texSample1.x *= 0.996; 
        texSample1.y *= 1.004; 
        texSample1 = tanEyeAngleToTexture(texSample1);
        color += textureLod(Texture0, texSample1, 0.0).rgb;
        vec2 texSample2 = oTanEyeAngle; 
        texSample2.x *= 1.004; 
        texSample2.y *= 0.996; 
        texSample2 = tanEyeAngleToTexture(texSample2);
        color += textureLod(Texture0, texSample2, 0.0).rgb;
        count = count + 2.0;
    } 
    if (samples && any(greaterThan(delta, vec2(0.015)))) {
        vec2 texSample1 = oTanEyeAngle;
        texSample1.x *= 0.994; 
        texSample1.y *= 1.006; 
        texSample1 = tanEyeAngleToTexture(texSample1);
        color += textureLod(Texture0, texSample1, 0.0).rgb;
        vec2 texSample2 = oTanEyeAngle; 
        texSample2.x *= 1.006; 
        texSample2.y *= 0.994; 
        texSample2 = tanEyeAngleToTexture(texSample2);
        color += textureLod(Texture0, texSample2, 0.0).rgb;
        count = count + 2.0;
    }
    FragColor = vec4(color / count, 1);
}

