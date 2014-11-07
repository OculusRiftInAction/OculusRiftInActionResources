#version 330

uniform mat4 Projection = mat4(1);
uniform mat4 ModelView = mat4(1);

layout(location = 0) in vec3 Position;
layout(location = 1) in vec2 TexCoord;
layout(location = 3) in vec4 Color;
layout(location = 4) in vec2 Edge;

out vec4 vColor;
out vec2 vEdge;
out vec2 vTexCoord;

void main() {
  gl_Position = Projection * ModelView * vec4(Position, 1);
  vColor = Color;
  vEdge = Edge;
  vTexCoord = TexCoord;
}

