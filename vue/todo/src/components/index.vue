<template>

  <div id='main-container'>
    <Objective v-for='objective in objectives' :key='objective.id' :objective='objective' :key_results='getKeyResultsPerObjective(objective.id)' />
  </div>

</template>

<script>

import Objective from '@/components/Objective'

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
    }
  }


}

</script>

<style>

</style>
