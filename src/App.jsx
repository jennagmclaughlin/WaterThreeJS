import { useEffect, useRef, useState } from 'react';
import * as THREE from 'three';
import './App.css';

function App() {
  const canvasRef = useRef(null);
  const [isDragging, setIsDragging] = useState(false); // track if the user is dragging the mouse

  useEffect(() => {
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(
      120, // field of view
      window.innerWidth / window.innerHeight, // aspect ratio
      1, // near plane
      1000 // far plane
    );
    camera.position.z = 50;
    const loadTexture = new THREE.TextureLoader();
    loadTexture.load('./textures/wave-pattern.png');
    // set up the WebGL renderer
    const renderer = new THREE.WebGLRenderer({
      canvas: canvasRef.current,
      antialias: true,
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);
    document.body.appendChild(renderer.domElement); // attach the renderer to the DOM

    // light blue background color
    scene.background = new THREE.Color(0x800851);

    // ambient light
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    scene.add(ambientLight);

    // plane geometry
    const planeGeometry = new THREE.PlaneGeometry(100, 100, 32, 32); // Added more segments for smoother wave

    // material for the plane
    const planeMaterial = new THREE.MeshBasicMaterial({ color: 0xffffff, wireframe: true });
    const planeMesh = new THREE.Mesh(planeGeometry, planeMaterial);
    planeMesh.rotateX(90);
    scene.add(planeMesh);

    // mouse movement and dragging
    let mouseX = 0;
    let mouseY = 0;

    // update mouse position
    const onMouseMove = (event) => {
      mouseX = (event.clientX / window.innerWidth) * 2 - 1;
      mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
      if (isDragging) {
        applyWaveEffect(mouseX, mouseY); 
      }
    };

    const onMouseDown = () => {
      setIsDragging(true);
    };

    const onMouseUp = () => {
      setIsDragging(false);
    };

    //wave effect to the plane based on mouse position
    const applyWaveEffect = (mouseX, mouseY) => {
      const time = Date.now() * 0.002; 
      const vertices = planeGeometry.attributes.position.array;

      // wave effect based on mouse position
      for (let i = 0; i < vertices.length; i += 3) {
        const x = vertices[i];
        const z = vertices[i + 2];

  
        const distance = Math.sqrt(Math.pow(mouseX - (x / 100), 2) + Math.pow(mouseY - (z / 100), 2)); // adjust wave radius
        if (distance < 0.3) { 
          vertices[i + 1] = Math.sin(x * 0.1 + time) * 12 + Math.sin(z * 0.1 + time) * 12; // wave amp
        }
      }

      planeGeometry.attributes.position.needsUpdate = true; 
    };

    // mouse event listeners
    window.addEventListener('mousemove', onMouseMove);
    window.addEventListener('mousedown', onMouseDown);
    window.addEventListener('mouseup', onMouseUp);

    // window resizing
    window.addEventListener('resize', onWindowResize, false);
    function onWindowResize() {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    }

    // animation loop
    function animate() {
      renderer.render(scene, camera);
      requestAnimationFrame(animate); 
    }
    animate(); 

  }, [isDragging]); 

  return <canvas ref={canvasRef} />;
}

export default App;
