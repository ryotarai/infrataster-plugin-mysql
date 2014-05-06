# infrataster-plugin-mysql

MySQL plugin for [Infrataster](https://github.com/ryotarai/infrataster)

## Installation

Add this line to your Gemfile:

    gem 'infrataster-plugin-mysql'

And then add the following line to your spec\_helper.rb:

    require 'infrataster-plugin-mysql'

## Usage

```ruby
describe server(:db) do
  describe mysql_query('SHOW STATUS') do
    it 'returns positive uptime' do
      row = results.find {|r| r['Variable_name'] == 'Uptime' }
      expect(row['Value'].to_i).to be > 0

      # `results` is a instance of `Mysql2::Result`
      # See: https://github.com/brianmario/mysql2
    end
  end
end
```

You can specify username and password by options passed to `Infrataster::Server.define`:

```ruby
Infrataster::Server.define(
  # ...
  mysql: {user: 'app', password: 'app'}
)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/infrataster-plugin-mysql/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
