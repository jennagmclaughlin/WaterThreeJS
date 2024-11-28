uniform float size;
uniform float flow_speed;
uniform float flow_strength;
uniform float choppiness;
uniform float u_time;
varying vec2 vUv;
varying vec3 pos;

in vec2 textureCoords;

uniform sampler2D flow_map;
uniform sampler2D voronoi;

void main() {
    // sample the flow_map to get the distortion values
    vec2 distortion1 = (texture(flow_map, vUv).rg * 2.0 - 1.0) * flow_strength;

    // apply the distortion to the texture coordinates + multiply by wave size
    vec2 distortedCoords = vUv + distortion1 * size;
    vec2 voronoiUV = vec2(0.1, 0.1);
    vec2 distortedVoronoi = voronoiUV + distortedCoords;
    vec4 voronoiColor = texture(voronoi, distortedVoronoi);

    // next, lerp/mix colors with voronoi

    // sample base texture using the distorted coordinates
    vec4 baseColor = texture(flow_map, distortedCoords);

    // output
    gl_FragColor = baseColor;
}