// Varying variables
out float z;
out vec2 vUv;
out vec2 textureCoords;

// Uniforms
uniform float u_time;
uniform mat4 transformationMatrix;

const float tiling = 6.0;

void main() {
    // Pass texture coordinates to the fragment shader
    vUv = uv;
    textureCoords = vec2(position.x/2.0 + 0.5, position.y/2.0 + 0.5) * tiling;

    // Transform the position to world space
    vec4 worldPosition = transformationMatrix * vec4(position, 1.0);

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
