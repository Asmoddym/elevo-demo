<template>
  <div class='key-result-container'>
    <span class='name'>
      {{ key_result.name }}
    </span>
  </div>
</template>

<script>

export default {
  name: 'KeyResult',
  props: {
    key_result: Object,
  },
}
</script>

<style>
  .key-result-container {
    border: 1px solid black;
    margin: 5px;
  }
</style>
