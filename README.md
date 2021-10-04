# Rails Kickoff Vite – WindiCSS

A rapid Rails 6.1+ application template. This particular template utilizes [WindiCSS](https://windicss.org/), a utility-first CSS framework for rapid UI development and [Vite](https://vitejs.dev/guide/), a build tool that aims to provide a faster and leaner development experience for modern web projects.

### Included gems

- [vite_rails](https://vite-ruby.netlify.app/guide/)

### WindiCSS by default

With Rails 6 we have webpacker by default now but it can become extremely slow to recompile as your application grows. Vite is an answer to this issue.

Vite consists of two major parts:

- A dev server that provides rich feature enhancements over native ES modules, for example extremely fast Hot Module Replacement (HMR).

- A build command that bundles your code with Rollup, pre-configured to output highly optimized static assets for production.

## How it works

When creating a new rails app simply pass the template file through.

### Creating a new app

Because Rails 6.1 ships with webpacker by default we need to skip installing it all together when creating a new app. The main flags you need are `--skip-webpack-install` and `--skip-javascript`.

**Important** - using these flags means **zero** javascript gets added to the app so you'll need to add libraries as you go. This template adds the following packages as a starting point:

- `@rails/ujs`
- `typescript`
- `vite-plugin-full-reload`
- `vite-plugin-windicss windicss`

⬇️ Clone the repo

```bash
git clone git@github.com:mlrcbsousa/kickoff_vite_rails.git
```

🏈 Kickoff a new app

```bash
rails new sample_app --skip-webpack-install --skip-javascript -m kickoff_vite_rails/template.rb
```

### Once installed what do I get?

- Vite + WindiCSS configured in the `app/frontend` directory.
- Enhanced views using WindiCSS.
- Git initialization out of the box.
- Custom defaults for button and form elements.

### Boot it up

`$ rails server`

### Boot up the dev server

`$ bin/vite dev`

### Extending Vite

Check out the [Vite Ruby website](https://vite-ruby.netlify.app/) for ideas on how to integrate more frameworks and toolings into your application.
