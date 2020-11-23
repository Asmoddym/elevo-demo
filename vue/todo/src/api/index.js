import { HTTP } from '@/http-common'

export const api = {
  createObjective: () => { return HTTP.post(`/objectives`) }
}
