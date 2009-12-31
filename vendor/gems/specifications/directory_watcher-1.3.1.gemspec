# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{directory_watcher}
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pease"]
  s.date = %q{2009-10-26}
  s.description = %q{}
  s.email = %q{tim.pease@gmail.com}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = ["History.txt", "README.txt", "Rakefile", "lib/directory_watcher.rb", "lib/directory_watcher/em_scanner.rb", "lib/directory_watcher/rev_scanner.rb", "lib/directory_watcher/scanner.rb", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake", "tasks/zentest.rake"]
  s.homepage = %q{http://codeforpeople.rubyforge.org/directory_watcher}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{codeforpeople}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A class for watching files within a directory and generating events when those files change}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.5.1"])
    else
      s.add_dependency(%q<bones>, [">= 2.5.1"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.5.1"])
  end
end
