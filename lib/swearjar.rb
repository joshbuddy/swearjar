require 'yaml'
require 'fuzzy_hash'
require 'dirge'

class Swearjar
  
  def self.default
    from_language
  end
  
  def self.from_language(language = 'en')
    new(~File.join('..', 'config', "#{language}.yml"))
  end

  attr_reader :tester, :hash
  
  def initialize(file)
    data = YAML.load_file(file)
    
    @tester = FuzzyHash.new
    @hash = {}
    
    data['regex'].each do |pattern, type|
      @tester[Regexp.new(pattern)] = type
    end
    
    data['simple'].each do |test, type|
      @hash[test] = type
    end
    
  end

  def scan(string, &block)
    string.scan(/\b[a-zA-Z-]+\b/) do |word|
      block.call(word, hash[word.downcase])
    end
    if match = tester.match_with_result(string)
      block.call(match.last, match.first)
    end
  end

  def profane?(string)
    scan(string) {|word, test| return true if !test.nil?}
    return false
  end

  def scorecard(string)
    scorecard = {}
    scan(string) {|word, test| test.each { |type| scorecard.key?(type) ? scorecard[type] += 1 : scorecard[type] = 1} if test}
    scorecard
  end

  def censor(string)
    censored_string = string.dup
    scan(string) {|word, test| censored_string.gsub!(word, block_given? ? yield(word) : word.gsub(/\S/, '*')) if test}
    censored_string
  end

end