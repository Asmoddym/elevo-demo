<template>
  <div class='objective-container'>
    <span class='name'>
      {{ objective.name }}
    </span>

    <WeightInput :weight='objective.weight' @update_weight='updateWeight' />

    <div class='key-result-list'>
      <KeyResult v-for='key_result in key_results' :key_result='key_result' :key='key_result.id' @update_key_result_weight='updateKeyResultWeight' />
      <div class='error-message' v-if='hasErrorMessage'>
        <span>
          {{ error_message }}
        </span>
      </div>
    </div>

    <div>
      <button class='add-kr-button' @click='addKeyResult()'>
        Add KR
      </button>
    </div>
  </div>
</template>

<script>

import WeightInput from '@/components/WeightInput'
import KeyResult from '@/components/KeyResult'

export default {
  name: 'Objective',
  components: {
    KeyResult,
    WeightInput
  },
  props: {
    objective: Object,
    key_results: Array,
    error_message: String
  },
  methods: {
    hasErrorMessage() {
      return typeof this.error_message !== 'undefined'
    },
    removeObjective() {
      this.$emit('remove_objective', this.objective.id)
    },
    addKeyResult() {
      this.$emit('add_key_result', this.objective.id)
    },
    updateWeight(weight) {
      this.$emit('update_weight', { objective_id: this.objective.id, weight: weight })
    },
    updateKeyResultWeight(data) {
      this.$emit('update_weight', { objective_id: this.objective.id, key_result_id: data.key_result_id, weight: data.weight })
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
