<template>
  <div class='objective-container'>
    <div class='objective-data'>
      <span class='name'>
        {{ objective.name }}
      </span>
      <div class='controls'>
        <span>
          Weight:
        </span>
        <WeightInput :weight='objective.weight' @update_weight='updateWeight' />
        <button class='add-kr-button' @click='addKeyResult()'>
          Add KR
        </button>
        <button class='remove-container' @click='removeObjective'>
          🗑️
        </button>
      </div>
    </div>

    <div class='key-results-list'>
      <KeyResult v-for='key_result in key_results' :key_result='key_result' :key='key_result.id' @update_key_result_weight='updateKeyResultWeight' />
    </div>
    <div class='error-message' v-if='hasErrorMessage'>
      <span>
        {{ error_message }}
      </span>
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
    display: flex;
    flex-direction: column;
    border: 1px solid black;
    padding: 5px;
    margin: 5px;
  }

  .objective-container .controls {
    display: flex;
    flex-direction: row;
  }

  .objective-container .controls > * {
    margin: 5px;
  }

  .objective-container .objective-data  {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }

  .objective-container .objective-data .name {
    align-self: center;
    font-size: 20px;
    font-weight: bolder;
  }

  .objective-container .key-results-list {
    display: flex;
    flex-wrap: wrap;
  }
</style>
