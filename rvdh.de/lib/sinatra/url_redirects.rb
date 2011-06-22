require 'sinatra/base'

module Sinatra
  module UrlRedirects
    def add_trailing_slash
      before do
        # add a trailing slash to urls that don't have one
        redirect(request.url + '/', 301) if (request.path_info =~ /(\/|\..+)$/).nil?
      end
    end
  end

  register UrlRedirects
end
