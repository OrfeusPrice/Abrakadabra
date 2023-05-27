# -*- encoding: utf-8 -*-
# stub: random-word-generator 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "random-word-generator".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Aimonetti".freeze]
  s.date = "2007-11-25"
  s.description = "Generate a string composed of one or many dictionary words. You can specify the amount of words, length of the string and separator. Great to generate activation codes easy to type.".freeze
  s.email = "mattaimonetti {at} gmail |dot| com".freeze
  s.extra_rdoc_files = ["History.txt".freeze, "License.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "lib/random_word_generator/wordlist.txt".freeze, "website/index.txt".freeze]
  s.files = ["History.txt".freeze, "License.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "lib/random_word_generator/wordlist.txt".freeze, "website/index.txt".freeze]
  s.homepage = "http://random-word-gen.rubyforge.org".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0".freeze)
  s.rubygems_version = "3.3.20".freeze
  s.summary = "Generate a string composed of one or many dictionary words. You can specify the amount of words, length of the string and separator. Great to generate activation codes easy to type.".freeze

  s.installed_by_version = "3.3.20" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 1
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sqlite3-ruby>.freeze, [">= 1.2.1"])
  else
    s.add_dependency(%q<sqlite3-ruby>.freeze, [">= 1.2.1"])
  end
end
