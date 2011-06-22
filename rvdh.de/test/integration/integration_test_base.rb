require File.expand_path('../../test_base', __FILE__)
require 'rack/test'

describe GrainyDays do
  include Rack::Test::Methods

  def app
    GrainyDays.set :environment, 'test'
    GrainyDays
  end

  def url(path)
    "http://example.org#{path}"
  end

  def assert_redirected_to(path, status = 301)
    redirect_url = last_response.headers['Location']
    status_msg = message(status_msg) { "Expected to be redirected with status #{status}, but was #{last_response.status}" }
    location_msg = message(location_msg) { "Expected to be redirected to #{path}, but was #{redirect_url}" }
    assert status == last_response.status, status_msg
    assert (path == redirect_url || url(path) == redirect_url), location_msg
  end
  
end
