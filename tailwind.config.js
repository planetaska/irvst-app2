/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./app/frontend/components/**/*.{js,svelte}",
    "./app/frontend/layouts/**/*.{js,svelte}",
    "./app/frontend/pages/**/*.{js,svelte}",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}

