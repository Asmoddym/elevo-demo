import { HTTP } from '@/http-common'

export const api = {
  createObjective: () => { return HTTP.post(`/objectives`) },
  removeObjective: (objective_id) => { return HTTP.delete(`/objectives/${objective_id}`) },
  addKeyResult: (objective_id) => { return HTTP.post(`objectives/${objective_id}/key_results`) },
}
