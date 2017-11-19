require 'bundler/gem_tasks'
require 'figaro'

Figaro.application.path = File.expand_path('../config/application.yml', __FILE__)
Figaro.load

namespace :bitbay do
  task :console do
    exec "irb -r bitbay -I ./lib"
  end
end
