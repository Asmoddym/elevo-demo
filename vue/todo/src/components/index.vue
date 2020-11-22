<template>

  <div id='main_container'>
    <div v-for='(item) in categories' :key='item.id'>
      <Category :category='item' :tasks='getCategoryTasks(item.id)' @category-change='changeCategory' />
    </div>
  </div>

</template>

<script>

import Category from '@/components/Category'

export default {
  name: 'Index',
  components: {
    Category
  },
  data () {
    return {
      tasks: window.tasks,
      categories: window.categories
    }
  },
  methods: {
    getCategoryTasks: function(category_id) {
      return this.tasks.filter((task) => { return task.category_id === category_id })
    },
    changeCategory: function(data) {
      let task_idx = this.tasks.findIndex((task) => { return task.id === data.task_id })
      let new_task = this.tasks[task_idx]
      new_task.category_id = data.category_id
      this.$set(this.tasks, task_idx, new_task)
    }
  }
}

</script>

<style>

  #main_container {
    display: flex;
  }

</style>
