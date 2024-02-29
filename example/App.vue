<template>
  <div>121</div>
</template>

<script setup>
import "hash-file/lib/wasm_exec.js"
const loadWasm = (path) => {
  const go = new Go();
  return new Promise((resolve) => {
    WebAssembly.instantiateStreaming(fetch(path), go.importObject)
    .then(result => {
      go.run(result.instance)
      resolve(result.instance)
    })
  })
}
loadWasm('hash-file/lib/hash-file.wasm');
</script>
