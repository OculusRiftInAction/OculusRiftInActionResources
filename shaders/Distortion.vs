#version 440
layout(location = 0) uniform vec2 EyeToSourceUVScale = vec2(1);
layout(location = 1) uniform vec2 EyeToSourceUVOffset = vec2(0);

layout(location = 0) in vec2 Position;
layout(location = 1) in vec2 TexCoord0;
layout(location = 3) in vec4 Color;

out vec4 oColor;
out vec2 oTexCoord0;
out vec2 oTanEyeAngle;

void main()
{
   gl_Position.x = Position.x;
   gl_Position.y = Position.y;
   gl_Position.z = 0.5;
   gl_Position.w = 1.0;
   oTanEyeAngle = TexCoord0;
// Vertex inputs are in TanEyeAngle space for the R,G,B channels (i.e. after chromatic aberration and distortion).
// Scale them into the correct [0-1],[0-1] UV lookup space (depending on eye)
   oTexCoord0 = TexCoord0;
   oTanEyeAngle = oTexCoord0; 
   oTexCoord0 = oTexCoord0 * EyeToSourceUVScale + EyeToSourceUVOffset;
   oTexCoord0.y = 1.0 - oTexCoord0.y;
   oColor = Color;              // Used for vignette fade.
};
