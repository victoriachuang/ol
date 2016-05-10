require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  it "allow access to businesses route" do
    get '/businesses'
    expect(last_response).to be_ok
  end
end