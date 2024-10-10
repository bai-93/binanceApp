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
    vec2 uv=(gl_FragCoord.xy/u_resolution-.5)*7.;
    uv.x*=u_resolution.x/u_resolution.y;
    vec3 color=vec3(0.);
    vec3 lineColor=vec3(.1843137254901961,.4,.9647058823529412);
    float frequency=(.9);
    
    for(float i=1.;i<20.;i++){
        float sinf=asin(sin((dot(sin(uv.x*1.85+(u_time-floor(i/20.))),atan(uv.y+u_time)))*atan(uv.x+i*.1)+(uv.x*(i/20.7)))*.4)+asin(i*.12/(i*frequency))*frequency/i;
        float fx=.0053/abs(sinf+(uv.y+i*.09));
        color+=fx*lineColor;
    }
    gl_FragColor=vec4(color,1.);
}