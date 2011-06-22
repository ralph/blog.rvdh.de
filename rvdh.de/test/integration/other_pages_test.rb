require File.expand_path('../integration_test_base', __FILE__)

describe GrainyDays do
  describe 'when requesting a page without trailing slash' do
    pages = %w(about archive contact)
    pages.each do |page|
      it 'should add a trailing slash version to the path' do
        get "/#{page}"
        assert_redirected_to "/#{page}/"
      end
    end
  end

  describe 'when requesting the about page' do
    it 'should respond to the about path' do
      get '/about/'
      assert last_response.ok?
    end
  end
end
