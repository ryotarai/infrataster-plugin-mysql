require "bundler/gem_tasks"
require "rspec/core/rake_task"

ENV['VAGRANT_CWD'] = File.expand_path('spec/')

def exec_and_abort_if_fail(cmd)
  system cmd
  unless $?.exitstatus == 0
    $stderr.puts "'#{cmd}' failed."
    abort
  end
end

desc 'Prepare and run tests'
task :spec => ['spec:prepare', 'spec:integration']

namespace :spec do
  RSpec::Core::RakeTask.new("integration") do |task|
    task.pattern = "./spec/{,/*/**}/*_spec.rb"
  end

  desc 'Prepare'
  task :prepare do
    exec_and_abort_if_fail '/usr/bin/vagrant up'
  end

  desc 'Provision'
  task :provision do
    exec_and_abort_if_fail '/usr/bin/vagrant provision'
  end

  desc 'Clean'
  task :clean do
    exec_and_abort_if_fail '/usr/bin/vagrant destroy -f'
  end
end
