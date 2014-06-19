#version 330

uniform vec4 Ambient;
uniform vec4 LightPosition[8];
uniform vec4 LightColor[8];
uniform int LightCount = 0;
uniform float ForceAlpha = 0;
uniform sampler2D sampler;

in vec3 vViewNormal;
in vec4 vViewPosition;
in vec2 vTexCoord;
out vec4 FragColor;

vec4 DoLight()
{
   vec3 normal = normalize(vViewNormal);
   vec3 light = Ambient.rgb;
   float alpha = 1;
   for (int i = 0; i < int(LightCount); i++)
   {
     vec3 pointToLight = normalize(LightPosition[i].xyz - vViewPosition.xyz);
     light += LightColor[i].rgb * clamp(dot(normal, pointToLight), 0, 1);
   }
   if (ForceAlpha != 0.0) {
     alpha = ForceAlpha;
   }
   return vec4(light, alpha);
}

void main()
{
    FragColor = DoLight() * texture(sampler, vTexCoord);
}
