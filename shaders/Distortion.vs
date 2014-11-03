#version 330

uniform vec2 EyeToSourceUVScale = vec2(1.0);
uniform vec2 EyeToSourceUVOffset = vec2(0.0);
uniform bool RightEye = true; 
uniform float DistortionWeight = 1.0;

layout(location = 0) in vec2 Position;
layout(location = 1) in vec2 TexCoord;
layout(location = 3) in vec4 Color;

out vec4 oColor;
out vec2 oTexCoord0;
out vec2 oTanEyeAngle;

// Vertex inputs are in TanEyeAngle space for the R,G,B channels (i.e. after chromatic aberration and distortion).
// Scale them into the correct [0-1],[0-1] UV lookup space (depending on eye)
vec2 tanEyeAngleToTexture(vec2 v) {
  vec2 result = v * EyeToSourceUVScale + EyeToSourceUVOffset;
  result.y = 1.0 - result.y;
  return result;
}

void main() {
  oTanEyeAngle = TexCoord;
  oTexCoord0 = tanEyeAngleToTexture(TexCoord);

  // Reconstruct the source coordinate based on the texture coordinate
  vec2 sourcePosition = oTexCoord0;
  sourcePosition *= 2.0;
  sourcePosition -= 1.0;
  sourcePosition.x *= 0.5;
  if (RightEye) {
    sourcePosition.x += 0.5;
  } else {
    sourcePosition.x -= 0.5;
  }
  
  gl_Position.xy = mix(sourcePosition, Position, DistortionWeight);
  gl_Position.z = 0.5;
  gl_Position.w = 1.0;
  oColor = Color;              // Used for vignette fade.
}
