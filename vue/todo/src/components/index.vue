<template>

  <div id='main-container'>
    <button class='add-objective-button' @click='createObjective()'>
      Create Objective
    </button>

    <div class='objective-list'>
      <Objective v-for='objective in objectives' :key='objective.id' :objective='objective' :key_results='getKeyResultsPerObjective(objective.id)' @remove_objective='removeObjective' @add_key_result='addKeyResult' @update_weight='updateWeight' />
    </div>
  </div>

</template>

<script>

import Objective from '@/components/Objective'
import { api } from '@/api'
import Vue from 'vue'

export default {
  name: 'Index',
  components: {
    Objective
  },
  data() {
    return {
      objectives: window.objectives_list,
      key_results: window.key_results_list
    }
  },
  methods: {
    getKeyResultsPerObjective(objective_id) {
      return this.key_results.filter((key_result) => { return key_result.objective_id === objective_id })
    },
    createObjective() {
      api.createObjective().then((res) => {
        this.objectives.push(res.data.objective)
      })
    },
    removeObjective(objective_id) {
      api.removeObjective(objective_id).then((res) => {
        let objective_idx = this.objectives.findIndex((objective) => { return objective.id === objective_id })
        this.objectives.splice(objective_idx, 1)
      })
    },
    addKeyResult(objective_id) {
      api.addKeyResult(objective_id).then((res) => {
        this.key_results.push(res.data.key_result)
      })
    },
    updateWeight(data) {
      api.updateWeight(data).then((res) => {
        if (res.data.success === true) {
          if (typeof data.key_result_id === 'undefined') {
            let objective_idx = this.objectives.findIndex((objective) => { return objective.id === data.objective_id })
            let objective = this.objectives[objective_idx]
            objective.weight = parseInt(data.weight)
            Vue.set(this.objectives, objective_idx, objective)
          } else {
            let key_result_idx = this.key_results.findIndex((key_result) => { return key_result.id === data.key_result_id })
            let key_result = this.key_results[key_result_idx]
            key_result.weight = parseInt(data.weight)
            Vue.set(this.key_results, key_result_idx, key_result)
          }
        }
      })
    }
  }
}

</script>

<style>

</style>
