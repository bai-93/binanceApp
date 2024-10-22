#include<flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float u_time;
out vec4 fragColor;

void main(){
    vec2 uv=(FlutterFragCoord().xy/uSize.xy-.5)*6.5;
    uv.x*=uSize.x/uSize.y;
    vec3 lineColor=vec3(.0235,.2667,.3882);
    vec3 backgroundColor=vec3(.0353,.0392,.0392);
    // fragColor=vec4(vec3(0.),1.);
    float frequency=.9;
    uv.y-=1.5;
    for(float i=1.;i<20.;i++){
        float sinf=(sin((dot(sin(uv.x*2.85+(u_time-floor(i/20.))),atan(uv.y+u_time)))*atan(uv.x+i*.1)+(uv.x*(i/20.7)))*.4)+asin(i*.12/(i*frequency))*frequency/i-.9;
        float fx=.004/abs((sinf+(uv.y+i*.04)));
        backgroundColor+=(fx*lineColor);
    }
    fragColor=vec4(backgroundColor,1.);
}