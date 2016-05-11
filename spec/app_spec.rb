require File.expand_path '../spec_helper.rb', __FILE__

describe 'Businesses listings' do
  it 'allows access to businesses route' do
    get '/businesses'
    expect(last_response).to be_ok
  end

  it 'allows access to business with valid ID' do
  	get '/businesses/5'
  	expect(last_response).to be_ok
  end

  it 'raises an error when requesting an invalid page' do
  	get '/businesses?page=60000'
  	expect(last_response.status).to eq(404)
  end

  it 'raises an error when requesting an invalid business ID' do
  	get '/businesses/60000'
  	expect(last_response.status).to eq(404)
  end

  it 'redirects the route when path contains an extra forward slash' do
  	get '/businesses/'
  	expect(last_response.status).to eq(302)
  end
end