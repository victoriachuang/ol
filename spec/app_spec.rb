require File.expand_path '../spec_helper.rb', __FILE__

describe 'Businesses listings' do

  it 'denies access to businesses route if no token is provided' do
    get '/businesses'
    expect(last_response.status).to eq(401)
  end

  it 'denies access to business route if no token is provided' do
    get '/businesses/5'
    expect(last_response.status).to eq(401)
  end

  it 'denies access to businesses route if a bad token is provided' do
    bad_authenticated_get '/businesses'
    expect(last_response.status).to eq(403)
  end

  it 'denies access to business route if no token is provided' do
    bad_authenticated_get '/businesses/5'
    expect(last_response.status).to eq(403)
  end

  it 'allows access to businesses route' do
    good_authenticated_get '/businesses'
    expect(last_response).to be_ok
  end

  it 'allows access to business with valid ID' do
  	good_authenticated_get '/businesses/5'
  	expect(last_response).to be_ok
  end

  it 'raises an error when requesting an invalid page' do
  	good_authenticated_get '/businesses?page=60000'
  	expect(last_response.status).to eq(404)
  end

  it 'raises an error when requesting an invalid business ID' do
  	good_authenticated_get '/businesses/60000'
  	expect(last_response.status).to eq(404)
  end

  it 'redirects the route when path contains a leading forward slash' do
  	good_authenticated_get '/businesses/'
  	expect(last_response.status).to eq(302)
  end
end