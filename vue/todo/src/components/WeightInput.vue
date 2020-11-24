<template>
  <div class='weight-input-container'>
    <input type='number' min='0' max='100' :value='weight' @change='updateWeight'>
  </div>
</template>

<script>

export default {
  name: 'WeightInput',
  props: {
    weight: Number
  },
  methods: {
    updateWeight(event) {
      this.$emit('update_weight', event.target.value)
    }
  }
}
</script>
