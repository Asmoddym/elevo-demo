<template>

  <div id='main-container'>
    <button class='add-objective-button' @click='createObjective()'>
      Create Objective
    </button>

    <div class='objective-list'>
      <Objective v-for='objective in objectives' :key='objective.id' :objective='objective' :key_results='getKeyResultsPerObjective(objective.id)' />
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
      return this.objectives.filter((objective) => { return objective.id === objective_id })
    },
    createObjective() {
      api.createObjective().then((res) => {
        let objective = res.data.objective
        this.objectives.push(objective)
      })
    }
  }


}

</script>

<style>

</style>
