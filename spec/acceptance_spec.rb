require 'spec_helper'

describe Swearjar do
  def original_text
    File.open(File.expand_path("../data/carlin_dirty_words.txt", __FILE__)).read
  end

  def expected_censored_text
    File.open(File.expand_path("../data/carlin_dirty_words_censored.txt", __FILE__)).read
  end

  it "censors George Carlin's Seven Dirty Words routine" do
    censored_text = Swearjar.default.censor(original_text)
    expect(censored_text).to eq(expected_censored_text)
  end
end
