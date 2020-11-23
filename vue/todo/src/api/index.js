import { HTTP } from '@/http-common'

export const api = {
  createObjective: () => { return HTTP.post(`/objectives`) },
  removeObjective: (objective_id) => { return HTTP.delete(`/objectives/${objective_id}`) },
  addKeyResult: (objective_id) => { return HTTP.post(`objectives/${objective_id}/key_results`) },
  updateWeight: (data) => { return HTTP.put(`objectives/${data.objective_id}${typeof data.key_result_id === 'undefined' ? '' : `/key_results/${data.key_result_id}`}`, { weight: data.weight }) }
}
