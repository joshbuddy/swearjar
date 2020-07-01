# Swearjar

Simple profanity detection with content analysis.

## Installation

`gem install swearjar`

## Usage

```ruby
require "swearjar"

sj = Swearjar.default

sj.profane?("jim henson has a massive hard on he is gonna use to fuck everybody")
# => true

sj.scorecard("jim henson has a massive hard on he is gonna use to fuck everybody")
# => {:sexual => 2}

sj.censor("jim henson has a massive hard on he is gonna use to fuck everybody")
# => "jim henson has a massive **** ** he is gonna use to **** everybody"
```

The censor mask `*` can be overridden:

```ruby
sj.censor("damn", "X")
# => "XXXX"
```

To load from a custom config file, you can do the following:

```ruby
# For an example see lib/config/en.yml
sj = Swearjar.new("my_swears.yml")
```
