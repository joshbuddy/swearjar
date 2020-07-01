require 'spec_helper'

describe Swearjar do
  it "censors George Carlin's Seven Dirty Words routine" do
    original_text = File.open(File.expand_path("../data/carlin_dirty_words.txt", __FILE__)).read
    expected_censored_text = File.open(File.expand_path("../data/carlin_dirty_words_censored.txt", __FILE__)).read
    censored_text = Swearjar.default.censor(original_text)

    expect(censored_text).to eq(expected_censored_text)
  end

  it "does not censor Epictetus' Enchiridion" do
    original_text = File.open(File.expand_path("../data/epictetus_enchiridion.txt", __FILE__)).read
    censored_text = Swearjar.default.censor(original_text)

    expect(censored_text).to eq(original_text)
  end
end
