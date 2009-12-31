# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{open4}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ara T. Howard"]
  s.date = %q{2009-10-18}
  s.description = %q{manage child processes and their io handles easily}
  s.email = %q{ara.t.howard@gmail.com}
  s.files = ["lib/open4.rb", "open4.gemspec", "Rakefile", "README", "README.erb", "samples/bg.rb", "samples/block.rb", "samples/exception.rb", "samples/simple.rb", "samples/spawn.rb", "samples/stdin_timeout.rb", "samples/timeout.rb", "white_box/leak.rb"]
  s.homepage = %q{http://github.com/ahoward/open4/tree/master}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{codeforpeople}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{open4}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
