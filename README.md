# Json::Logger
Short description and motivation.

## Usage
A JSON logger for Rails, this logger is built upon lograge and ougai. It functions as a Rails engine and works seamlessly without any additional configuration. Simply adding it as a gem is sufficient to enable its functionality.

What it does:
```ruby
  initializer(:rails_stdout_logging, before: :initialize_logger) do
    Rails.application.configure do
      config.logger = Json::Logger::Logger.custom_logger(name: 'Rails')


      config.lograge.enabled = true
      config.colorize_logging = false

      config.lograge.formatter = Lograge::Formatters::Raw.new
      config.lograge.custom_options = Json::Loggger::CustomOptions
    end
  end
```


## Installation
Adding this gem to your Gemfile is all that is required. It is based on a Rails engine and will automatically initialize itself upon startup.

Presently, there is support for custom hooks. However, if you prefer to make modifications to the formatter in the gem, you can do so by copying it to your lib folder and making the desired changes according to your requirements.


```ruby
gem 'json-logger'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install json-logger
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
