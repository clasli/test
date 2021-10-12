uniform float uTime;
varying vec4 vP;

void main() {
    // vec3 color = vec3(1); //sin(uTime));    // color = color1;
    vec3 color = vec3(sin(vP.z), cos(vP.y), 1.0);
    gl_FragColor = vec4(color,1.0);
}