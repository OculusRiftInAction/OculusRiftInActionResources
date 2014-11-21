void main(void)
{
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  vec3 color = iDir;
  gl_FragColor = vec4(color,1.0);
}

