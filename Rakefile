#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.


require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)


libfiles = 'lib/*.rb lib/*/*.rb'

desc "Run flog against lib files"
task :flog do
  out=`flog #{libfiles}`
  puts out
end

desc "Run reek against lib files"
task :reek do
  out=`reek #{libfiles}`
  puts out
end


task :default => :spec
