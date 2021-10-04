# Template Name: Kickoff Vite Rails with WindiCSS
# Author: Manuel Sousa
# Instructions: $ rails new myapp --skip-webpack-install --skip-javascript -d <postgresql, mysql, sqlite3> -m template.rb

require "fileutils"
require "shellwords"

def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def add_gems
  gem 'vite_rails', '~> 2.0', '>= 2.0.9'
end

def add_root_route
  route "root to: 'home#index'"
end

def copy_templates
  directory "app", force: true
end

def add_vite
  run 'bundle exec vite install'
  inject_into_file('vite.config.ts', "import FullReload from 'vite-plugin-full-reload'\n", after: %(from 'vite'\n))
  inject_into_file('vite.config.ts', "import WindiCSS from 'vite-plugin-windicss'\n", after: %(from 'vite'\n))
  inject_into_file('vite.config.ts', "\n    FullReload(['config/routes.rb', 'app/views/**/*']),", after: 'plugins: [')
  inject_into_file('vite.config.ts', "\n    WindiCSS({
      root: __dirname,
      scan: {
        fileExtensions: ['erb', 'haml', 'html', 'vue', 'js', 'ts', 'jsx', 'tsx'],
        dirs: ['app/views', 'app/frontend'], // or app/javascript, or app/packs
      },
    }),", after: 'plugins: [')
end

def add_javascript
  run "yarn add @rails/ujs vite-plugin-full-reload typescript vite-plugin-windicss windicss"
end

# Main setup
source_paths

add_gems

after_bundle do
  add_root_route
  copy_templates
  add_javascript
  add_vite # adds vite + WindiCSS (Tailwind on Steriods)

  git :init
  git add: "."
  git commit: %Q{ -m "Initial commit" }

  say
  say "Kickoff Vite Rails app successfully created! 👍", :green
  say
  say "Switch to your app by running:"
  say "$ cd #{app_name}", :yellow
  say
  say "Then run:"
  say "$ rails server", :green
end
