# Swearjar

Simple profanity detection with content analysis.

## Installation

`gem install swearjar`

## Usage

```ruby
require "swearjar"

Swearjar.default.profane?("jim henson has a massive hard on he is gonna use to fuck everybody")
# => true

Swearjar.default.scorecard("jim henson has a massive hard on he is gonna use to fuck everybody")
# => {:sexual => 2}

Swearjar.default.censor("jim henson has a massive hard on he is gonna use to fuck everybody")
# => "jim henson has a massive **** ** he is gonna use to **** everybody"
```

To load from a custom config file, you can do the following:

```ruby
sj = Swearjar.new
# For an example see lib/config/en.yml
sj.load_file("my_swears.yml")
```
