import { useEffect, useRef, useState } from 'react';
import * as THREE from 'three';
import './App.css';
import vertexShaderSky from './shaders/sky/vertexShader.glsl';
import fragmentShaderSky from './shaders/sky/fragmentShader.glsl';

function App() {
  const canvasRef = useRef(null);
  const [isDragging, setIsDragging] = useState(false); // track if the user is dragging the mouse

  useEffect(() => {
    const scene = new THREE.Scene();
    scene.background = new THREE.Color().setHSL( 0.6, 0, 1 );
    scene.fog = new THREE.Fog(scene.background, 1, 5000);
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
      alpha: true
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.shadowMap.enabled = true;
    document.body.appendChild(renderer.domElement); // putting renderer in document

    const hemisphere = new THREE.HemisphereLight(0xffffff, 0xffffff, 2);
    hemisphere.color.setHSL(0.6, 1, 0.6);
    hemisphere.groundColor.setHSL(0.095, 1, 0.75);
    hemisphere.position.set(0, 1, 0);
    scene.add(hemisphere);

    // main light
    const sun = new THREE.DirectionalLight(0xffffff, 2);
    sun.position.set();
    sun.castShadow = true;
    scene.add(sun);

    // ambient light
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    scene.add(ambientLight);

    const dirLight = new THREE.DirectionalLight( 0xffffff, 0 );
    dirLight.color.setHSL( 0.1, 1, 0.95 );
    dirLight.position.set( -1, 1.75, 1 );
    dirLight.position.multiplyScalar( 30 );
    scene.add( dirLight );

    dirLight.castShadow = true;

    dirLight.shadow.mapSize.width = 2048;
    dirLight.shadow.mapSize.height = 2048;

    const d = 50;

    dirLight.shadow.camera.left = - d;
    dirLight.shadow.camera.right = d;
    dirLight.shadow.camera.top = d;
    dirLight.shadow.camera.bottom = - d;

    dirLight.shadow.camera.far = 500;
    dirLight.shadow.bias = -0.0001;

    const uniforms = {
      'topColor': { value: new THREE.Color( 0x0077ff ) },
      'bottomColor': { value: new THREE.Color( 0xffffff ) },
      'offset': { value: 33 },
      'exponent': { value: 0.5 }
    };
    uniforms[ 'topColor' ].value.copy( hemisphere.color );

    scene.fog.color.copy( uniforms[ 'bottomColor' ].value );

    const skyGeo = new THREE.SphereGeometry( 300, 100, 100 );
    const skyMat = new THREE.ShaderMaterial( {
      uniforms: uniforms,
      vertexShader: vertexShaderSky,
      fragmentShader: fragmentShaderSky,
      side: THREE.BackSide
    } );

    const sky = new THREE.Mesh( skyGeo, skyMat );
    scene.add(sky);

    // plane geometry
    const planeGeometry = new THREE.PlaneGeometry(100, 100, 32, 32); // Added more segments for smoother wave

    // material for the plane
    const planeMaterial = new THREE.MeshBasicMaterial({ color: 0x000000, wireframe: true });
    const planeMesh = new THREE.Mesh(planeGeometry, planeMaterial);
    planeMesh.castShadow = true;
    planeMesh.rotateX(200);
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
