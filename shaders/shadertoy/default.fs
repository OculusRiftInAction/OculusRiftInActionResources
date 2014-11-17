void main(void)
{
  vec2 uv = gl_FragCoord.xy / iResolution.xy;

  vec3 color = iDir;
  if (!all(equal(color, abs(color)))) {
    color = vec3(1.0) - abs(color);
  }

  gl_FragColor = vec4(color,1.0);
}

