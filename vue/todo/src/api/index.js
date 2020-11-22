import { HTTP } from '@/http-common'

export const api = {
  updateTaskCategory: (data) => { return HTTP.post(`/tasks/${data.task_id}/update_category`, { category_id: data.category_id }) }
}
