const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'selector',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      dropShadow: {
        'dark': '4px 4px 1px rgba(0, 0, 0, 0.5)',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        mPlusCode: ['M PLUS 1 Code', 'monospace'],
        kanit: ["Kanit", "sans-serif"],
        fell: ["IM Fell English SC", "serif"],
        Inconsolata: ["Inconsolata", "monospace"],
      },
      colors: {
        'base-dark': '#1C0F00',
        'base-light': '#EACAA6',
        'milk': '#87B5DF',
        'hermit': {
          'yellow': '#FAF231',
          'orange': '#FDB600',
          'lt-green': '#498B00',
          'dk-green': '#366600',
          'lt-purple': '#7162CD',
          'dk-purple': '#4735B7',
          'lt-blue': '#57B3E5',
          'teal': '#57B0C3',
          'dk-blue': '#03537E',
          'pink': '#FDAFCB',
          'red': '#FF0F00',
          'smoke': '#444444',
          'burnt': '#2F2F2F'
        },
        'swabbie': {
          "st-lt-primary": "#B5E5FF",
          "st-primary": "#3E717E",
          "st-drk-primary": "#40677D",
          "st-lt-secondary": "#FFD7C2",
          "st-secondary": "#FFB389",
          "st-drk-secondary": "#FF9256",
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin')
  ]
}
