# DO NOT MODIFY THIS FILE

require 'digest/sha1'
require "rubygems"

module Bundler
  module SharedHelpers

    def reverse_rubygems_kernel_mixin
      # Disable rubygems' gem activation system
      ::Kernel.class_eval do
        if private_method_defined?(:gem_original_require)
          alias rubygems_require require
          alias require gem_original_require
        end

        undef gem
      end
    end

    def default_gemfile
      gemfile = find_gemfile
      gemfile or raise GemfileNotFound, "The default Gemfile was not found"
      Pathname.new(gemfile)
    end

    def in_bundle?
      find_gemfile
    end

  private

    def find_gemfile
      return ENV['BUNDLE_GEMFILE'] if ENV['BUNDLE_GEMFILE']

      previous = nil
      current  = File.expand_path(Dir.pwd)

      until !File.directory?(current) || current == previous
        filename = File.join(current, 'Gemfile')
        return filename if File.file?(filename)
        current, previous = File.expand_path("#{current}/.."), current
      end
    end

    def clean_load_path
      # handle 1.9 where system gems are always on the load path
      if defined?(::Gem)
        me = File.expand_path("../../", __FILE__)
        $LOAD_PATH.reject! do |p|
          next if File.expand_path(p).include?(me)
          p != File.dirname(__FILE__) &&
            Gem.path.any? { |gp| p.include?(gp) }
        end
        $LOAD_PATH.uniq!
      end
    end

    extend self
  end
end

module Bundler
  LOCKED_BY    = '0.9.5'
  FINGERPRINT  = "10c3d262a7999ec7fb437aaa57d8bd38d2550dc1"
  SPECS        = [
        {:name=>"liquid", :version=>"2.0.0", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/liquid-2.0.0/lib"]},
        {:name=>"open4", :version=>"1.0.1", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/open4-1.0.1/lib"]},
        {:name=>"RedCloth", :version=>"4.2.2", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/RedCloth-4.2.2/lib", "/Users/ralph/.bundle/ruby/1.9.1/gems/RedCloth-4.2.2/ext", "/Users/ralph/.bundle/ruby/1.9.1/gems/RedCloth-4.2.2/lib/case_sensitive_require"]},
        {:name=>"yui-compressor", :version=>"0.9.1", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/yui-compressor-0.9.1/lib"]},
        {:name=>"directory_watcher", :version=>"1.3.1", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/directory_watcher-1.3.1/lib"]},
        {:name=>"stemmer", :version=>"1.0.1", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/stemmer-1.0.1/lib"]},
        {:name=>"syntax", :version=>"1.0.0", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/syntax-1.0.0/lib"]},
        {:name=>"maruku", :version=>"0.6.0", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/maruku-0.6.0/lib"]},
        {:name=>"classifier", :version=>"1.3.1", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/classifier-1.3.1/lib"]},
        {:name=>"jekyll", :version=>"0.5.7", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/jekyll-0.5.7/lib"]},
        {:name=>"rake", :version=>"0.8.7", :groups=>[:default], :load_paths=>["/Users/ralph/.rvm/gems/ruby-1.9.1-p378%global/gems/rake-0.8.7/lib"]},
        {:name=>"activesupport", :version=>"2.3.5", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/activesupport-2.3.5/lib"]},
        {:name=>"activerecord", :version=>"2.3.5", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/activerecord-2.3.5/lib"]},
        {:name=>"activeresource", :version=>"2.3.5", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/activeresource-2.3.5/lib"]},
        {:name=>"rack", :version=>"1.0.1", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/rack-1.0.1/lib"]},
        {:name=>"actionpack", :version=>"2.3.5", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/actionpack-2.3.5/lib"]},
        {:name=>"actionmailer", :version=>"2.3.5", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/actionmailer-2.3.5/lib"]},
        {:name=>"rails", :version=>"2.3.5", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/rails-2.3.5/lib"]},
        {:name=>"closure-compiler", :version=>"0.2.0", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/closure-compiler-0.2.0/lib"]},
        {:name=>"jammit", :version=>"0.4.4", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/jammit-0.4.4/lib"]},
        {:name=>"Platform", :version=>"0.4.0", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/Platform-0.4.0/lib"]},
        {:name=>"POpen4", :version=>"0.1.4", :groups=>[:default], :load_paths=>["/Users/ralph/.bundle/ruby/1.9.1/gems/POpen4-0.1.4/lib"]},
      ]
  AUTOREQUIRES = {:default=>[["jekyll", false], ["jammit", false]]}

  extend SharedHelpers

  def self.cripple_ruby_gems
    reverse_rubygems_kernel_mixin
    patch_rubygems
  end

  def self.match_fingerprint
    print = Digest::SHA1.hexdigest(File.read(File.expand_path('../../Gemfile', __FILE__)))
    unless print == FINGERPRINT
      abort 'Gemfile changed since you last locked. Please `bundle lock` to relock.'
    end
  end

  def self.setup(*groups)
    match_fingerprint
    SPECS.each do |spec|
      spec[:load_paths].each { |path| $LOAD_PATH.unshift path }
    end
  end

  def self.require(*groups)
    groups = [:default] if groups.empty?
    groups.each do |group|
      (AUTOREQUIRES[group] || []).each do |file, explicit|
        if explicit
          Kernel.require file
        else
          begin
            Kernel.require file
          rescue LoadError
          end
        end
      end
    end
  end

  def self.patch_rubygems
    specs = SPECS

    ::Kernel.send(:define_method, :gem) do |dep, *reqs|
      opts = reqs.last.is_a?(Hash) ? reqs.pop : {}

      dep  = dep.name if dep.respond_to?(:name)
      unless specs.any?  { |s| s[:name] == dep }
        e = Gem::LoadError.new "#{dep} is not part of the bundle. Add it to Gemfile."
        e.name = dep
        e.version_requirement = reqs
        raise e
      end

      true
    end
  end

  # Setup bundle when it's required.
  cripple_ruby_gems
  setup
end
