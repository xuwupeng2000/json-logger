# Ougai Json Logger
To ensure consistency in log formatting across your Rails services, using a JSON logger is often necessary, especially when working with log services such as Kibana. This gem provides a pre-defined JSON logging format specifically tailored for Rails applications. By adding this gem to your Gemfile, you can achieve the desired log consistency across your Rails services effortlessly.


## Usage
A JSON logger for Rails, this logger is built upon lograge and ougai. It functions as a Rails engine and works seamlessly without any additional configuration. Simply adding it as a gem is sufficient to enable its functionality.

What it does:
```ruby
  initializer(:rails_stdout_logging, before: :initialize_logger) do
    Rails.application.configure do
      config.logger = OugaiJson::Logger::Logger.custom_logger(name: 'Rails')

      config.lograge.enabled = true
      config.colorize_logging = false

      config.lograge.formatter = Lograge::Formatters::Raw.new
      config.lograge.custom_options = OugaiJson::Loggger::CustomOptions
    end
  end
```

Log output
```
{"@timestamp":"2024-02-28T09:07:58.098Z","message":"  ActiveRecord::SchemaMigration Load (0.1ms)  SELECT \"schema_migrations\".\"version\" FROM \"schema_migrations\" ORDER BY \"schema_migrations\".\"version\" ASC","log":{"level":"DEBUG","logger":"Rails"},"trace":{"id":null},"error":{},"request":{},"response":{},"process":{"id":45821},"url":{},"event":{}}
{"@timestamp":"2024-02-28T09:07:58.121Z","message":"  Rendering /Users/jawu/.rbenv/versions/3.3.0/lib/ruby/gems/3.3.0/gems/railties-7.1.3.2/lib/rails/templates/rails/welcome/index.html.erb","log":{"level":"DEBUG","logger":"Rails"},"trace":{"id":null},"error":{},"request":{},"response":{},"process":{"id":45821},"url":{},"event":{}}
{"@timestamp":"2024-02-28T09:07:58.122Z","message":"Rails Request","log":{"level":"INFO","logger":"Rails"},"trace":{"id":null},"error":{},"request":{"method":"GET","body":{"content":"{\"controller\"=>\"rails/welcome\", \"action\"=>\"index\"}"}},"response":{"status_code":200},"process":{"id":45821},"url":{"path":"/"},"event":{"action":"Rails::WelcomeController#index","duration":6.79}}
{"@timestamp":"2024-02-28T09:07:59.588Z","message":"  Rendering /Users/jawu/.rbenv/versions/3.3.0/lib/ruby/gems/3.3.0/gems/railties-7.1.3.2/lib/rails/templates/rails/welcome/index.html.erb","log":{"level":"DEBUG","logger":"Rails"},"trace":{"id":null},"error":{},"request":{},"response":{},"process":{"id":45821},"url":{},"event":{}}
{"@timestamp":"2024-02-28T09:07:59.588Z","message":"Rails Request","log":{"level":"INFO","logger":"Rails"},"trace":{"id":null},"error":{},"request":{"method":"GET","body":{"content":"{\"controller\"=>\"rails/welcome\", \"action\"=>\"index\"}"}},"response":{"status_code":200},"process":{"id":45821},"url":{"path":"/"},"event":{"action":"Rails::WelcomeController#index","duration":1.82}}
```


## Installation
Adding this gem to your Gemfile is all that is required. It is based on a Rails engine and will automatically initialize itself upon startup.

Presently, there is support for custom hooks. However, if you prefer to make modifications to the formatter in the gem, you can do so by copying it to your lib folder and making the desired changes according to your requirements.


```ruby
gem 'ougai-json-logger'

```

And then execute:
```bash
$ bundle
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
