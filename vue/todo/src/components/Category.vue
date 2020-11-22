<template>
  <div class='category_column' :id='"category_" + category.id'>
    <div class='title'>
      <span class='name'>
        {{ category.name }}
      </span>
      <span class='tasks_number'>
        {{ `(${tasks.length})` }}
      </span>
    </div>

    <div class='tasks_container'>
      <div v-for='(task) in tasks' :key='task.id'>
        <Task :task='task' @category-change='changeCategory'/>
      </div>
    </div>
  </div>
</template>

<script>

import Task from '@/components/Task'

export default {
  name: 'Category',
  components: {
    Task
  },
  props: {
    tasks: {
      required: true
    },
    category: {
      required: true
    }
  },
  methods: {
    changeCategory(data) {
      this.$emit('category-change', data)
    }
  }
}

</script>

<style>

  .category_column {
    min-width: 200px;
    display: flex;
    flex-direction: column;
    border: 1px solid black;
    padding: 10px;
    margin: 10px;
  }

  .category_column .title {
    display: flex;
    justify-content: space-between;
    width: 100%;
    padding-bottom: 10px;
    flex-grow: 1;
  }

</style>
