require 'digest/sha1'
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end

  def good_authenticated_get(uri)
    get_using_token(uri, 'lg_JhXDOSTZNJcVjH7IpsQ')
  end

  def bad_authenticated_get(uri)
    get_using_token(uri, 'THIS_IS_NOT_A_REAL_TOKEN')
  end

  def get_using_token(uri, token)
    thing_to_hash = uri + token
    hashed_thing = Digest::SHA1.hexdigest thing_to_hash
    get uri, nil, {'Authorization' => hashed_thing}
  end
end

RSpec.configure { |c| c.include RSpecMixin }