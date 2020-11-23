<template>
  <div class='key-result-container'>
    <span class='name'>
      {{ key_result.name }}
    </span>

    <WeightInput :weight='key_result.weight' @update_weight='updateWeight' />
  </div>
</template>

<script>

import WeightInput from '@/components/WeightInput'

export default {
  name: 'KeyResult',
  components: {
    WeightInput
  },
  props: {
    key_result: Object,
  },
  methods: {
    updateWeight(weight) {
      this.$emit('update_key_result_weight', { key_result_id: this.key_result.id, weight: weight })
    }
  }
}

</script>

<style>
  .key-result-container {
    border: 1px solid black;
    margin: 5px;
  }
</style>
