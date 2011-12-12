require 'yaml'
require 'fuzzy_hash'

class Swearjar

  def self.default
    from_language
  end

  def self.from_language(language = 'en')
    new(File.join(File.dirname(__FILE__), 'config', "#{language}.yml"))
  end

  attr_reader :tester, :hash

  def initialize(file = nil)
    @tester = FuzzyHash.new
    @hash = {}
    load_file(file) if file
  end

  def load_file(file)
    data = YAML.load_file(file)

    data['regex'].each do |pattern, type|
      @tester[Regexp.new(pattern)] = type
    end if data['regex']

    data['simple'].each do |test, type|
      @hash[test] = type
    end if data['simple']
  end

  def scan(string, &block)
    string = string.to_s
    string.scan(/\b[a-zA-Z-]+\b/) do |word|
      block.call(word, hash[word.downcase] || hash[word.downcase.gsub(/e?s$/,'')] )
    end
    if match = tester.match_with_result(string)
      block.call(match.last, match.first)
    end
  end

  def profane?(string)
    string = string.to_s
    scan(string) {|word, test| return true if !test.nil?}
    return false
  end

  def scorecard(string)
    string = string.to_s
    scorecard = {}
    scan(string) {|word, test| test.each { |type| scorecard.key?(type) ? scorecard[type] += 1 : scorecard[type] = 1} if test}
    scorecard
  end

  def censor(string)
    censored_string = string.to_s.dup
    scan(string) {|word, test| censored_string.gsub!(word, block_given? ? yield(word) : word.gsub(/\S/, '*')) if test}
    censored_string
  end

end