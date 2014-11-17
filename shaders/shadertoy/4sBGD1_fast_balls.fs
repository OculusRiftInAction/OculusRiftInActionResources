// Created by inigo quilez - iq/2013
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

#define VIS_SAMPLES 25


float hash1( vec2  n ) { return fract(43758.5453123*sin(dot(n,vec2(1.0,113.0)))); }
vec2  hash2( float n ) { return fract(43758.5453123*sin(vec2(n,n+1.0))); }
vec3  hash3( vec2  n ) { return fract(43758.5453123*sin(dot(n,vec2(1.0,113.0))+vec3(0.0,1.0,2.0))); }

vec4 castRay( in vec3 ro, in vec3 rd, in int num )
{
    vec2 pos = floor(ro.xz);
    vec2 ri = 1.0/rd.xz;
    vec2 rs = sign(rd.xz);
    vec2 ris = ri*rs;
    vec2 dis = (pos-ro.xz+ 0.5 + rs*0.5) * ri;
    
    vec4 res = vec4( -1.0, 0.0, 0.0, 0.0 );
    
    // traverse regular grid (in 2D)
    for( int i=0; i<12; i++ ) 
    {
        if( i>num ) break;// continue;
        
        // intersect sphere
        vec3  rr = hash3(pos);
        vec2  oo = 0.5 + 0.3*(-1.0 + 2.0*rr.xy);
        vec3  ce = vec3( pos.x+oo.x, 0.5, pos.y+oo.y );
        float ra = (0.5+0.5*rr.z)*min( min(oo.x,1.0-oo.x), min(oo.y,1.0-oo.y) );
        vec3  rc = ro - ce;
        float b = dot( rd, rc );
        float c = dot( rc, rc ) - ra*ra;
        float h = b*b - c;
        if( h>0.0 )
        {
            float s = -b - sqrt(h);
            res = vec4( s, 0.0, pos );
            break;
        }

        // step to next cell        
        vec2 mm = step( dis.xy, dis.yx ); 
        dis += mm*ris;
        pos += mm*rs;
    }

    return res;
}

vec3 cameraPath( float t )
{
    vec2 p  = 200.0*sin( 0.01*t*vec2(1.2,1.0) + vec2(0.1,0.9) );
         p += 100.0*sin( 0.02*t*vec2(1.1,1.3) + vec2(1.0,4.5) );
    float y = 4.0 + 2.0*sin(0.05*t);

    return vec3( p.x, y, p.y );
}

const vec3 bgcol = vec3(0.0);

void main( void )
{
    vec2 q = gl_FragCoord.xy / iResolution.xy;
        
    // montecarlo   
    vec3 tot = vec3(0.0);
    for( int a=0; a<VIS_SAMPLES; a++ )
    {
        vec4 rr = texture2D( iChannel1, (gl_FragCoord.xy+floor(256.0*hash2(float(a))))/iChannelResolution[1].xy );
        vec2 p = -1.0 + 2.0*(gl_FragCoord.xy+rr.xz) / iResolution.xy;
        p.x *= iResolution.x/ iResolution.y;
        float time = 16.0*(iGlobalTime + (0.5/24.0)*rr.w);

        // camera
        vec3  ro = cameraPath( time );
        vec3  ta = cameraPath( time+5.0 ); ta.y = ro.y - 5.5;
        float cr = 0.2*cos(0.1*time*0.5);
        vec3  ww = normalize( ta - ro);
        vec3  uu = normalize(cross( vec3(sin(cr),cos(cr),0.0), ww ));
        vec3  vv = normalize(cross(ww,uu));
        float r2 = p.x*p.x*0.32 + p.y*p.y;
        p *= (7.0-sqrt(37.5-11.5*r2))/(r2+1.0);
        vec3  rd = normalize(iDir); // normalize( p.x*uu + p.y*vv + 2.0*ww );

        // dof
        vec3 fp = ro + rd * 17.0;
        ro += (uu*(-1.0+2.0*rr.y) + vv*(-1.0+2.0*rr.w))*0.05;
        rd = normalize( fp - ro );

        vec3 col = bgcol;
        
        // trace bounding plane y=1
        float tp = (1.0-ro.y)/rd.y;
        if( tp>0.0 )
        {
            ro = ro + rd*tp;
            float n = 1.0 - 1.0/rd.y;

            // trace spheres            
            vec4 res  = castRay(  ro, rd, int(n) );
            float t = res.x;
            vec2 vos = res.zw;
            if( t>0.0 )
            {
                vec3  pos = ro + rd*t;
                float id  = hash1( vos );
                vec3  rr = hash3(vos);
                vec2  oo = 0.5 + 0.3*(-1.0 + 2.0*rr.xy);
                vec3  nor = normalize( fract(pos)-vec3(oo.x,0.5,oo.y) );
                col = 0.5 + 0.45*sin( 3.1*id + 0.0+vec3(1.0,0.5,2.0) );
                col *= (0.5+0.5*nor.y)* clamp( pos.y, 0.0, 1.0 );
                col *= exp(-0.02*t*t);
            }
        }
        tot += col;
    }
    tot /= float(VIS_SAMPLES);
    
    tot = pow( clamp(tot,0.0,1.0), vec3(0.44) );

    gl_FragColor = vec4( tot, 1.0 );
}