require File.expand_path '../spec_helper.rb', __FILE__

describe "Businesses listings" do
  it "allows access to businesses route" do
    get '/businesses'
    expect(last_response).to be_ok
  end

  it "allows access to business with valid ID" do
  	get '/businesses/5'
  	expect(last_response).to be_ok
  end
end