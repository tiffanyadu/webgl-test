precision mediump float;

varying vec2 fragTexCoord;
varying vec3 fragNormal;

uniform vec3 ambientLightIntensity;
uniform vec3 sunlightIntensity;
uniform vec3 sunlightDirection;
uniform sampler2D sampler;

void main() {
  vec3 surfaceNormal = normalize(fragNormal);
  vec3 normSunDir = normalize(sunlightDirection);
  vec4 texel = texture2D(sampler, fragTexCoord);

  vec3 lightIntensity = ambientLightIntensity + sunlightIntensity * max(dot(fragNormal, normSunDir), 0.0);

  gl_FragColor = vec4(texel.rgb * lightIntensity, texel.a);
}