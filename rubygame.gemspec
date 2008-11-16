Gem::Specification.new do |s|
  s.name     = "rubygame"
  s.version  = '2.4.0' # NOTE: Don't forget to update in ./configure as well
  s.author   = "John Croisant"
  s.email    = "jacius@gmail.com"
  s.homepage = "http://rubygame.org/"
  s.summary  = "Clean and powerful library for game programming"
  s.has_rdoc = true

  s.files = FileList.new do |fl|
    fl.include("{lib,ext,samples,doc}/**/*")
    fl.exclude(/svn/)
    #fl.exclude(/\.#{OBJEXT}/)
  end

  s.require_paths = ["lib", "lib/rubygame/", "ext/rubygame/"]
  s.extensions = ["Rakefile"]

  s.extra_rdoc_files = FileList.new do |fl|
    fl.include "doc/*.rdoc"
    fl.include "README", "LICENSE", "CREDITS", "ROADMAP", "NEWS"
  end
end

