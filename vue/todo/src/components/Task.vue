<template>
  <div class='task_container' :id='"task_" + task.id'>
    <span>
      {{ task.name }}
    </span>
    <div class='controls'>
      <select @change='changeCategory($event)'>
        <option v-for='(category) in otherCategories()' :key='category.id' :name='category.name' :value='category.id' :selected='task.category_id === category.id ? "selected" : ""'>
          {{ category.name }}
        </option>
      </select>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Task',
  props: {
    task: {
      required: true
    }
  },
  data() {
    return {
      categories: window.categories
    }
  },
  methods: {
    changeCategory: function(event) {
      this.$emit('category-change', { category_id: parseInt(event.target.value), task_id: this.task.id })
    },
    otherCategories: function() {
      return this.categories.filter((cat) => { return cat.id !== this.task.category_id })
    }
  }
}

</script>

<style>

.task_container {
  border: 1px solid grey;
  padding: 5px;
  margin: 3px;
}

</style>
