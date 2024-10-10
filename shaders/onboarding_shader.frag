/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI_TWO 1.570796326794897
#define PI 3.141592653589793
#define TWO_PI 6.283185307179586

void main(){
    vec2 uv=(gl_FragCoord.xy/u_resolution-.5)*4.;
    uv.x*=u_resolution.x/u_resolution.y;
    vec3 color=vec3(0.);
    float frequency=1.9;
    
    float sinf=sin((dot(sin(uv.x*2.34+u_time),sin(uv.x+u_time)))*atan(uv.x)*sin(uv.x*2.));
    float fx=.003/abs(sinf+uv.y);
    color+=fx;
    gl_FragColor=vec4(color,1.);
}