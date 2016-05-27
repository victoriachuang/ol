require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end

  def authenticated_get(uri)
    get uri, nil, {'Authorization' => "lg_JhXDOSTZNJcVjH7IpsQ"}
  end

  def bad_authenticated_get(uri)
    get uri, nil, {'Authorization' => "THIS_IS_NOT_A_REAL_TOKEN"}
  end
end

RSpec.configure { |c| c.include RSpecMixin }