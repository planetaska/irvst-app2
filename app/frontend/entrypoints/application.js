import '../stylesheets/main.css'

import Layout from '../layouts/Layout.svelte'

import { createInertiaApp } from '@inertiajs/svelte'

// append CSRF token to axios requests
// import axios from 'axios'
// const csrfToken = document.querySelector('meta[name=csrf-token]').content
// axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

const pages = import.meta.glob('../pages/**/*.svelte', { eager: true })

createInertiaApp({
  resolve: name => {
    const page =  pages[`../pages/${name}.svelte`]
    return { default: page.default, layout: page.layout || Layout }
  },
  setup({ el, App, props }) {
    new App({ target: el, props })
  },
})