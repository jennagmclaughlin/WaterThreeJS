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

uniform sampler2D voronoi_texture;

float sinAdjustment(float coord, float time, float distortX, float distortY) {
    return sin(coord * distortX + time * distortY);
}

void main() {
    // how many "tiles" of voronoi visible
    vec2 uvRepeat = vUv * repeat;

    uvRepeat.x += 0.1 * (
        (sinAdjustment(uvRepeat.y, u_time, 1.5, 0.5) + sinAdjustment(uvRepeat.y, u_time, 4.8, 0.75) + sinAdjustment(uvRepeat.y, u_time, 5.3, 0.2)) / 3.5
    );
    uvRepeat.y += 0.1 * (
        (sinAdjustment(uvRepeat.x, u_time, 2.2, 0.64) + sinAdjustment(uvRepeat.x, u_time, 4.3, 1.65) + sinAdjustment(uvRepeat.x, u_time, 2.2, 0.45)) / 3.5
    );

    float a = pow( 1.0 - 1.0 * abs(dot(vNormal, vPositionNormal)), 1.0 );

    float distort;
    // sample voronoi with uv; move waves horizontally
    distort = texture2D(voronoi_texture, uvRepeat - vec2(u_time / flow_speed, 0.0)).r;

    // combine
    float combineVoronoi = a * distort;

    // output
    gl_FragColor = vec4( mix(vec3(light_foam_color), water_color, combineVoronoi + distort), 1. );
}