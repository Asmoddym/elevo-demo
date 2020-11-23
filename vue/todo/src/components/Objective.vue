<template>
  <div class='objective-container'>
    <span class='name'>
      {{ objective.name }}
    </span>
  </div>
</template>

<script>
export default {
  name: 'Objective',
  props: {
    objective: Object,
    key_results: Array
  },
}
</script>
