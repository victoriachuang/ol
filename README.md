# ol

## Required gems

The API endpoints require the `sinatra` gem:
```
gem install sinatra
```

The tests require `rspec` and `rack-test`:
```
gem install rspec
gem install rack-test
```

## API endpoint use

This API provides two read-only endpoints, `/businesses` and `/businesses/:id`.

In the command line, run
```
ruby app.rb
```
In your browser, go to `localhost:4567/businesses`.

#### `/businesses`

This route will fetch a page of 50 businesses, sorted by ID.

To request a different page, go to `localhost:4567/businesses?page=NUMBER`. In the event that no parameter is given, `NUMBER` will default to 1.

A 404 error will be raised if an invalid page is requested.

#### `/businesses/:id`

This route will fetch a specific business, as specified by the `:id` parameter.

A 404 error will be raised if an invalid business is requested.

## Tests

In the root directory, run `rspec spec/app_spec.rb` in the command line.

The specs include testing 200 status codes for valid page and business ID requests and 400 status codes for invalid requests.