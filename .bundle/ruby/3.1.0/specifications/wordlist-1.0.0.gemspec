# -*- encoding: utf-8 -*-
# stub: wordlist 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "wordlist".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Postmodern".freeze]
  s.date = "2021-11-02"
  s.description = "Wordlist is a Ruby library for reading, manipulating, and creating wordlists, efficiently.".freeze
  s.email = "postmodern.mod3@gmail.com".freeze
  s.executables = ["wordlist".freeze]
  s.extra_rdoc_files = ["ChangeLog.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["ChangeLog.md".freeze, "LICENSE.txt".freeze, "README.md".freeze, "bin/wordlist".freeze]
  s.homepage = "https://github.com/postmodern/wordlist.rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.20".freeze
  s.summary = "Ruby library for reading, manipulating, and creating wordlists.".freeze

  s.installed_by_version = "3.3.20" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rubygems-tasks>.freeze, ["~> 0.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 2.4"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
  else
    s.add_dependency(%q<rubygems-tasks>.freeze, ["~> 0.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.4"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
  end
end
