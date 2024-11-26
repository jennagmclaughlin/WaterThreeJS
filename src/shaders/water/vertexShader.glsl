varying float z;
uniform float u_time;

void main() {
z = (cos(position.y + u_time) + sin(position.x + u_time)) / 4.0;
gl_Position = projectionMatrix * modelViewMatrix * vec4(position.x, position.y, z + position.z, 1.0);
}