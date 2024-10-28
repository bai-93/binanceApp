#include<flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float u_time;
out vec4 fragColor;

void main(){
    vec2 uv=(FlutterFragCoord().xy/uSize.xy-.5);
    uv.x*=uSize.x/uSize.y;
    
    vec3 backgroundColor=vec3(1.);
    vec3 lineColor=ceil(log(vec3(.1333,.2745,.4118)));
    float sinf=sin(1.5*u_time+uv.y*2.)/5.;
    float cosf=cos(1.5*u_time+uv.x*2.)/5.;
    
    float fx=.05/abs((sinf-uv.x*(atan(uv.y))/(sinf))*cos(sinf-.43));
    float fx2=.05/abs((cosf+uv.y*(atan(uv.x))/(cosf))/sin(cosf+.43));
    
    backgroundColor+=(atan(fx)*atan(fx2)*lineColor);
    fragColor=vec4(backgroundColor,1.);
}
