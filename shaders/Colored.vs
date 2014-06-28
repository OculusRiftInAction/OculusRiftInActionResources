#version 330

uniform mat4 Projection = mat4(1);
uniform mat4 ModelView = mat4(1);
uniform bool InstanceTransformActive = false;

layout(location = 0) in vec3 Position;
layout(location = 3) in vec4 Color;

out vec4 vColor;

void main() {
  mat4 ViewXfm = ModelView;

  if (InstanceTransformActive) {
      ViewXfm = ViewXfm * InstanceTransform;
  }

  gl_Position = Projection * ViewXfm * vec4(Position, 1);
  vColor = Color;
}
