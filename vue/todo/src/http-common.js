const API_URL = '/'

window.axios = require('axios')

const HTTP = window.axios.create({
  baseURL: API_URL
})

HTTP.interceptors.request.use(config => {
  config.headers['Content-Type'] = 'application/json'
  config.headers['Accept'] = 'application/json'
  config.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  return config
})

HTTP.interceptors.response.use(
  response => response,
  error => {
    return Promise.reject(error)
  }
)

export { HTTP }
