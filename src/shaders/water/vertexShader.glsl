// Varying variables
varying vec2 vUv;
varying vec3 vNormal;
varying vec3 vPositionNormal;
out float z;

out vec2 textureCoords;
const float tiling = 0.2;

// Uniforms
uniform float u_time;
uniform mat4 transformationMatrix;

void main() {
    // convert uv attribute to vUv varying
    vUv = uv;
    vNormal = normalize( normalMatrix * normal );
    vPositionNormal = normalize(( modelViewMatrix * vec4(position, 1.0) ).xyz);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

    // Transform the position to world space
    vec4 worldPosition = transformationMatrix * vec4(position, 1.0);

    textureCoords = vec2(position.x / 2.0 + 0.5, position.y / 2.0 + 0.5) * tiling;

    // Calculate animated z position based on time
    z = (cos(position.y + u_time) + sin(position.x + u_time)) / 4.0;

    // Modify the final position for vertex animation
    gl_Position = projectionMatrix * modelViewMatrix * vec4(
        position.x, 
        2.0 * sin(position.z / 4.0) + position.y, 
        z + position.z, 
        1.0
    );
}
