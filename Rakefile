require 'bundler/gem_tasks'

require 'rake/testtask'
task default: [:test]

# SPECS =====================================================================

desc 'Run tests (default)'
Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/test_*.rb']
  t.ruby_opts = ['-Itest']
  t.ruby_opts << '-rubygems' if defined? Gem
end
