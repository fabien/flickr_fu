Gem::Specification.new do |s|
  s.name     = "flickr_fu"
  s.version  = "0.2.2"
  s.date     = "2008-12-30"
  s.summary  = "Provides a ruby interface to flickr via the REST api"
  s.email    = "ben@commonthread.com"
  s.homepage = "http://github.com/commonthread/flickr_fu"
  s.description = "Provides a ruby interface to flickr via the REST api"
  s.has_rdoc = true
  s.authors  = ["Ben Wyrosdick"]
  s.files = %w(LICENSE README Rakefile flickr_fu.gemspec) + Dir.glob("{lib,spec}/**/*")
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.add_dependency("mime-types", "> 0.0.0")
  s.add_dependency("xml-magic", "> 0.0.0")
  s.add_dependency("rest-client", ">= 0.5")
end
