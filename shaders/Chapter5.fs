#version 330

uniform vec4 Ambient;
uniform vec4 LightPosition[8];
uniform vec4 LightColor[8];
uniform int LightCount = 0;
uniform mat4 ModelView = mat4(1);

in vec3 vViewNormal;
in vec4 vViewPosition;
in vec3 vModelPosition;
in vec4 vColor;
out vec4 FragColor;

void main() {
  vec3 light;

  // Poor man's wireframe: blacken every unit cube near its vertices
  if ((abs(vModelPosition.x) >= 0.475 && abs(vModelPosition.x) < 0.49999)
      || (abs(vModelPosition.y) >= 0.475 && abs(vModelPosition.y) < 0.49999)
      || (abs(vModelPosition.z) >= 0.475 && abs(vModelPosition.z) < 0.49999)) {
    light = vec3(0, 0, 0);
  } else {
    vec3 normal = normalize(vViewNormal);
    light = Ambient.rgb;
    for (int i = 0; i < int(LightCount); i++) {
      vec4 lightPos = ModelView * LightPosition[i];
      vec3 pointToLight = normalize(lightPos.xyz - vViewPosition.xyz);
      light += LightColor[i].rgb * clamp(dot(normal, pointToLight), 0, 1);
    }
  }
  FragColor = vec4(light, 1) * vColor;
}
