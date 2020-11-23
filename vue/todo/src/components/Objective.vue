<template>
  <div class='objective-container'>
    <span class='name'>
      {{ objective.name }}
    </span>
    <button @click='removeObjective()'>
      🗑️
    </button>
  </div>
</template>

<script>
export default {
  name: 'Objective',
  props: {
    objective: Object,
    key_results: Array
  },
  methods: {
    removeObjective() {
      this.$emit('remove_objective', this.objective.id)
    }
  }
}
</script>

<style>
  .objective-container {
    border: 1px solid black;
  }
</style>
