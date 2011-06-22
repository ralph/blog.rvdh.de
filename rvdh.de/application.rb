# Encoding.default_internal = Encoding.default_external = 'UTF-8'
APP_ROOT = File.expand_path('.')
$: << APP_ROOT + '/lib'

require 'bundler/setup'
require 'sinatra/base'
require 'padrino-helpers'
require 'padrino-core/application/rendering'
require 'sinatra_extensions'
require 'erubis'
require 'redcloth'
require 'sinatra/hackety_sling'
require 'post'
require 'ruby-debug' if ENV['DEBUG']

class Application < Sinatra::Base
  register Padrino::Helpers
  register Padrino::Rendering
  register Sinatra::UrlRedirects
  register Sinatra::HacketySling
  include Sinatra::HacketySling
  add_trailing_slash

  set :views, File.dirname(__FILE__) + '/views'
  set :public, File.dirname(__FILE__) + '/public'
  set :fetch_layout_path, 'layout.erubis'

  get '/' do
    @headline = "Hello, I'm Ralph."
    super
  end
end
