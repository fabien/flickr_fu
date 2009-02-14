require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'

GEM_NAME = "flickr_fu"
AUTHOR = "Ben Wyrosdick"
EMAIL = "ben@commonthread.com"
HOMEPAGE = "http://github.com/commonthread/flickr_fu"
SUMMARY = "Provides a ruby interface to flickr via the REST api"
GEM_VERSION = "0.2.2"

spec = Gem::Specification.new do |s|
  s.name     = GEM_NAME
  s.version  = GEM_VERSION
  s.date     = "2008-12-30"
  s.summary  = SUMMARY
  s.email    = EMAIL
  s.homepage = HOMEPAGE
  s.description = SUMMARY
  s.has_rdoc = true
  s.authors  = [AUTHOR]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.add_dependency("mime-types", "> 0.0.0")
  s.add_dependency("xml-magic", "> 0.0.0")
  s.add_dependency("rest-client", ">= 0.5")
  s.files = %w(LICENSE README Rakefile flickr_fu.gemspec) + Dir.glob("{lib,spec}/**/*")
end
 
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end 

desc 'Generate documentation for flickr_fu.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'flickr_fu'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# RSpec support
begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  require 'spec'
end
begin
  require 'spec/rake/spectask'
rescue LoadError
  puts <<-EOS
	  To use rspec for testing you must install rspec gem:
	  gem install rspec
  EOS
  exit(0)
end

task :default => :spec

desc "Run the specs under spec/models"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc "Run rcov"
task :rcov do
  system "rcov spec/**/*.rb -x /var/lib -x spec/"
end
