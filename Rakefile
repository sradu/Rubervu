require 'rubygems'
require 'rake/gempackagetask'
require "rake/rdoctask"

spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "rubervu"
    s.version   =   "0.1"
    s.author    =   "Radu Spineanu"
    s.email     =   "radu @nospam@ rdconcept.ro"
    s.summary   =   "Gem for accessing the UberVU.com API."
    s.files     =   FileList['lib/*.rb', 'lib/rubervu/*.rb', 'test/*'].to_a
    s.require_path  =   "lib"
    s.test_files = Dir.glob('tests/*.rb')
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]

    s.add_dependency("json")
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
end


Rake::RDocTask.new do |rdoc|
        rdoc.main     = "README"
        rdoc.rdoc_dir = "doc/html"
        rdoc.title    = "Rubervu Documentation"
        rdoc.rdoc_files.include( "README",  "History.txt",
                                 "lib")
end

desc "Upload current documentation to Rubyforge"
task :upload_docs => [:rdoc] do
        sh "scp -r doc/html/* " +
           "sradu@rubyforge.org:/var/www/gforge-projects/rubervu"
end
