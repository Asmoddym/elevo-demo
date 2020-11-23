<template>
  <div class='objective-container'>
    <span class='name'>
      {{ objective.name }}
    </span>

    <div class='key-result-list'>
      <KeyResult v-for='key_result in key_results' :key_result='key_result' :key='key_result.id' />
    </div>

    <div>
      <button class='add-kr-button' @click='addKeyResult()'>
        Add KR
      </button>
    </div>

    <button
  </div>
</template>

<script>

import KeyResult from '@/components/KeyResult'
export default {
  name: 'Objective',
  components: {
    KeyResult
  },
  props: {
    objective: Object,
    key_results: Array
  },
  methods: {
    removeObjective() {
      this.$emit('remove_objective', this.objective.id)
    },
    addKeyResult() {
      this.$emit('add_key_result', this.objective.id)
    }
  }
}
</script>

<style>
  .objective-container {
    border: 1px solid black;
    margin: 5px;
  }
</style>
