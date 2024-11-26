import { useEffect } from 'react';

import * as THREE from 'three';
import vertexShaderSky from './shaders/sky/vertexShader.glsl';
import fragmentShaderSky from './shaders/sky/fragmentShader.glsl';

import SceneInit from './lib/SceneInit';

function App() {
  useEffect(() => {
    const test = new SceneInit('myThreeJsCanvas');
    test.initialize();
    test.animate();

    const hemisphere = new THREE.HemisphereLight(0xffffff, 0xffffff, 2);
    hemisphere.color.setHSL(0.6, 1, 0.6);
    hemisphere.groundColor.setHSL(0.095, 1, 0.75);
    hemisphere.position.set(0, 1, 0);
    test.scene.add(hemisphere);

     // main light
     const sun = new THREE.DirectionalLight(0xffffff, 2);
     sun.position.set();
     sun.castShadow = true;
     test.scene.add(sun);

    const skyUniforms = {
      'topColor': { value: new THREE.Color( 0x0077ff ) },
      'bottomColor': { value: new THREE.Color( 0xffffff ) },
      'offset': { value: 33 },
      'exponent': { value: 0.6 }
    };
    skyUniforms[ 'topColor' ].value.copy( hemisphere.color );

    test.scene.fog = new THREE.Fog(test.background, 1, 5000);
    test.scene.fog.color.copy( skyUniforms[ 'bottomColor' ].value );

    const skyGeo = new THREE.SphereGeometry( 300, 100, 100 );
    const skyMat = new THREE.ShaderMaterial( {
      uniforms: skyUniforms,
      vertexShader: vertexShaderSky,
      fragmentShader: fragmentShaderSky,
      side: THREE.BackSide
    } );

    const sky = new THREE.Mesh( skyGeo, skyMat );
    test.scene.add(sky);

    function vertexShader() {
      return `
          varying float z;
          uniform float u_time;
          void main() {
            z = (cos(position.y + u_time) + sin(position.x + u_time)) / 4.0;
            gl_Position = projectionMatrix * modelViewMatrix * vec4(position.x, position.y, z + position.z, 1.0);
          }
        `;
    }
    function fragmentShader() {
      return `
          void main() {
            gl_FragColor = vec4(1, 0, 0, 1);
          }
        `;
    }
    const geometry = new THREE.BoxGeometry(1, 1, 1, 1, 1, 1);
    const material = new THREE.ShaderMaterial({
      uniforms: test.uniforms,
      fragmentShader: fragmentShader(),
      vertexShader: vertexShader(),
    });
    const mesh = new THREE.Mesh(geometry, material);
    mesh.rotation.x = Math.PI / 2;
    test.scene.add(mesh);
  }, []);

  return (
    <div>
      <canvas id="myThreeJsCanvas" />
    </div>
  );
}

export default App;
