# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{stemmer}
  s.version = "1.0.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Mower"]
  s.autorequire = %q{stemmer}
  s.cert_chain = nil
  s.date = %q{2005-04-20}
  s.email = %q{self@mattmower.com}
  s.files = ["lib/stemmer", "lib/stemmer.rb", "lib/stemmer/porter.rb"]
  s.homepage = %q{http://rubyforge.org/projects/stemmer/}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Word stemming algorithm(s)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
