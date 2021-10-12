// boids thing https://threejs.org/examples/webgl_gpgpu_birds.html
// panels thing https://smrghsh.github.io/floor-panels-deform/ 

uniform float uTime;
varying vec4 vP;
// varyings pass something from vertex shader to fragment shader
// vertex shader gets buffer (set of points in grid)
// varying is what vertex calculates and stuff
float rand(float n){return fract(sin(n) * 43758.5453123);}

float noise(float p){
	float fl = floor(p);
  float fc = fract(p);
	return mix(rand(fl), rand(fl + 1.0), fc);
}


void main() {    
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    vec4 p = modelPosition;
    
    p.y =  1.0/sin(p.x + 2.0*uTime) + cos(p.z)*noise(p.z/10.);
    // p.y = sin(p.x + p.x * noise(p.z/10.) + uTime);



    vec4 viewPosition = viewMatrix * p;
    vec4 projectedPosition = projectionMatrix * viewPosition;


    gl_Position = projectedPosition;
    gl_PointSize = 3.0;
    vP = p;
}