require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "awesome_animal"
    gem.summary = "randomly generate an animal with an adjective"
    gem.description = "randomly generate an animal with an adjective!"
    gem.email = "rit@quietdynamite.com"
    gem.homepage = "http://github.com/rit/awesome_animal"
    gem.authors = ["Rit Li"]
    gem.add_development_dependency "bacon", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |spec|
    spec.libs << 'spec'
    spec.pattern = 'spec/**/*_spec.rb'
    spec.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "awesome_animal #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Guessing adjectives"
task :adjective do
  words = File.read('/usr/share/dict/words').split("\n")
  words = words.select { |w| (3..10).include? w.size }
  suffics = [
    'cal',
    'end',
    'ick',
    'ing',
    'ized',
    'mic',
    'nic',
    'ous',
    'pic',
    'ted',
    'tic',
  ]
  suffics = "(" + suffics.join('|')  + ")" + '\z'
  adjective = Regexp.new(suffics)
  words = words.select { |w| w.match adjective }

  File.open('lib/adjective.txt', 'w') do |f|
    f.write(words.map(&:downcase).join("\n"))
  end
end
