import { useEffect } from 'react';
import * as THREE from 'three';
import './App.css';

function App() {
  useEffect(() => {
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(
      50, // fov
      2, // aspect ratio. no need to set it since it will be calculated every frame to account for resizing windows. 2 = default
      1, // near plane
      1000 // far plane
    );
    camera.position.z = 96;

    const canvas = document.getElementById('canvas');
    const renderer = new THREE.WebGLRenderer({
      canvas,
      antialias: true // 3d object will look smooth
    });
    renderer.setPixelRatio(window.devicePixelRatio);
    document.body.appendChild(renderer.domElement); // putting renderer in document

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5); // color, intensity
    ambientLight.castShadow = true;
    scene.add(ambientLight);

    const boxGeometry = new THREE.BoxGeometry(16, 16, 16);
    const boxMaterial = new THREE.MeshNormalMaterial();
    const boxMesh = new THREE.Mesh(boxGeometry, boxMaterial);
    scene.add(boxMesh);

    window.addEventListener( 'resize', onWindowResize, false );
    function onWindowResize() {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    }

    const animate = () => {
      boxMesh.rotation.x += 0.01;
      boxMesh.rotation.y += 0.01;
      renderer.render(scene, camera); // call render function, pass scene and camera
      window.requestAnimationFrame(animate); // run function every frame
    }
    animate();
  }, []);

  return (
    <div>
      <canvas id="canvas"></canvas>
    </div>
  )
}

export default App
