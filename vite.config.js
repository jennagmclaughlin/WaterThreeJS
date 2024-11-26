import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import glslify from 'rollup-plugin-glslify';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), glslify()]
})
