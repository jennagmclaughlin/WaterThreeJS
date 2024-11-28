import { useEffect } from 'react';
import * as THREE from 'three';

import vertexShaderSky from './shaders/sky/vertexShader.glsl';
import fragmentShaderSky from './shaders/sky/fragmentShader.glsl';

import vertexShaderWater from './shaders/water/vertexShader.glsl';
import fragmentShaderWater from './shaders/water/fragmentShader.glsl';

import flowMap from './assets/FlowMap.png';
import voronoi from './assets/Voronoi.png';

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

    const skyUniforms = {
      'topColor': { value: new THREE.Color( 0x0077ff ) },
      'bottomColor': { value: new THREE.Color( 0xffffff ) },
      'offset': { value: 33 },
      'exponent': { value: 0.6 }
    };
    skyUniforms[ 'topColor' ].value.copy( hemisphere.color );

    const skyGeo = new THREE.SphereGeometry( 300, 100, 100 );
    const skyMat = new THREE.ShaderMaterial( {
      uniforms: skyUniforms,
      vertexShader: vertexShaderSky,
      fragmentShader: fragmentShaderSky,
      side: THREE.BackSide
    } );

    const sky = new THREE.Mesh(skyGeo, skyMat);
    test.scene.add(sky);

    // const waterUniforms = {
      
    // }

    const geometry = new THREE.PlaneGeometry(12, 12, 12);
    const material = new THREE.ShaderMaterial({
      uniforms: test.uniforms,
      fragmentShader: fragmentShaderWater,
      vertexShader: vertexShaderWater
    });
    test.uniforms.flow_map = {value: new THREE.TextureLoader().load(flowMap)};
    test.uniforms.voronoi = {value: new THREE.TextureLoader().load(voronoi)};
    const mesh = new THREE.Mesh(geometry, material);
    mesh.rotation.y = - Math.PI / 4; // rotates so we can see side by default
    test.scene.add(mesh);
  }, []);

  return (
    <div>
      <canvas id="myThreeJsCanvas" />
    </div>
  );
}

export default App;
