#version 330

uniform mat4 Projection = mat4(1);
uniform mat4 ModelView = mat4(1);

layout(location = 0) in vec3 Position;
layout(location = 2) in vec3 Normal;

out vec4 vColor;

void main() {
  gl_Position = Projection * ModelView * vec4(Position, 1);

  vec3 color = Normal;
  if (!all(equal(color, abs(color)))) {
    color = vec3(1.0) - abs(color);
  }
  vColor = vec4(color, 1.0);
}
