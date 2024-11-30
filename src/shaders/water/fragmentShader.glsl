uniform float size;
uniform float flow_speed;
uniform float flow_strength;
uniform float choppiness;
uniform float u_time;
uniform vec3 water_color;
uniform vec3 light_foam_color;

uniform vec2 repeat;

varying vec2 vUv;
varying vec3 vNormal;
varying vec3 vPositionNormal;
varying vec3 pos;

in vec2 textureCoords;

uniform sampler2D flow_map;
uniform sampler2D voronoi_texture;


void main() {
    float a = pow( 2.0 - 1.0 * abs(dot(vNormal, vPositionNormal)), 1.0 );

    // sample voronoi with UV; multiply by uniform to get repeat
    float a2 = texture2D(voronoi_texture, vUv * repeat).r;

    // combine alphas
    float opacity = a * a2;

    // vec4 water_color = vec4(0.0, 0.5071135, 1.0, 1.0);
    // vec4 dark_foam_color = vec4(0.0, 0.19, 0.38, 1.0);
    // vec4 light_foam_color = vec4(0.9, 0.9, 0.95, 1.0);

    // // apply the distortion to the texture coordinates + multiply by wave size
    // vec2 distortedCoords = vUv + distortion1 * size;
    // vec2 voronoiUV = vec2(0.1, 0.1);
    // vec2 distortedVoronoi = voronoiUV + distortedCoords;
    // vec4 voronoiColor = texture(voronoi_texture, distortedVoronoi);

    // // lerp/mix dark foam with voronoi
    // vec4 waterDarkMix = mix(water_color, dark_foam_color, 1.0);
    // vec4 waterVoronoiMix1 = mix(voronoiColor, waterDarkMix, 1.0);

    // lerp/mix light foam color with first mix, then mix result

    // get current screen position
    // highp vec4 screenPos = gl_FragCoord;
    // vec4 screenPosDistort = vec4(distortion1, screenPos);
    // gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
    // distToCamera = gl_Position.w;

    // sample base texture using the distorted coordinates
    // vec4 baseColor = waterVoronoiMix1;

    // output
    gl_FragColor = vec4( mix(vec3(light_foam_color), water_color, opacity), 1. );
}