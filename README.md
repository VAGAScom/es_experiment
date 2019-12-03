# EsExperiment

Easy way to create and modify documents on the fly before indexing in Elasticsearch.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'es_experiment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install es_experiment

## Usage


### Setup
On your spec_helper or rails_helper file include the code below with the configuration for your application.

```ruby
EsExperiment.configure do |config|
  config.connection_tries = 3
  config.time_between_connection_tries = 3
  config.documents_path = 'spec/fixtures/factories/'
  config.schema_path = 'spec/fixtures/schema.json'
  config.url = 'localhost:9200'
  config.index = 'profissionais'
end
```
### How to use

#### Simple use
For example, if you have a json file named `user.json` in the directory `spec/fixtures/factories/`
```json
{
    "user_id": 999,
    "name": "Fulando",
    "address": {
        "street": "First avenue"
    }
}
```
You can index this doc like this:
```Ruby
EsExperiment.create(:user)
```
Also, it's possible to change values before indexing the doc:
```Ruby
EsExperiment.create(:user, fields: { user_id: 123, 'address.street': 'Portland St.'})
```

#### Document with children docs
TODO: Write usage instructions here

## TODOs

- Increase the tests coverage.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `docker-compose up` after that `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/VAGAScom/es_experiment. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).