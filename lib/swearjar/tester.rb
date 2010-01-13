require 'yaml'
require 'fuzzy_hash'
require 'bloomfilter'

class Swearjar
  class Tester
    
    def initialize(config_file)
      data = YAML.load_file
      
      @tester = FuzzyHash.new
      
      data['regex'].each do |pattern, type|
        @tester[Regexp.new(pattern)] = type
      end
      
      data['simple'].each do |test, type|
        @tester[test] = type
      end
      
    end
    
    def scan(string, &block)
      string.scan(/\b[\b]+\b/, &block)
    end

    def profane?(string)
      scan(string) {|w| return true}
    end
    
  end
end