# ConsulKvClient
[![wercker status](https://app.wercker.com/status/bd257f583aaaa0dfb337b5d540170063/s "wercker status")](https://app.wercker.com/project/bykey/bd257f583aaaa0dfb337b5d540170063)

## なんですか、これは？

- consul の KVS に登録されている情報を一覧で表示します
- consul の KVS に情報を登録します
- consul の KVS に情報を削除します

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'consul_kv_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install consul_kv_client

## Usage

### list

```sh
bundle exec ./bin/consul_kv_client 127.0.0.1:8500 list
```

output.

```sh
+-----+-------+
| Key | Value |
+-----+-------+
| foo | bar   |
+-----+-------+
```

### put

```sh
bundle exec ./bin/consul_kv_client 127.0.0.1:8500 put key value
```

output.

```sh
true
```

### delete

```sh
bundle exec ./bin/consul_kv_client 127.0.0.1:8500 delete key
```

output.

```sh
true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/consul_kv_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
