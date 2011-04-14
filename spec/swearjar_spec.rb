require 'spec_helper'

describe Swearjar do

  it "should detect dirty words" do
    Swearjar.default.profane?('fuck you jim henson').should be_true
  end

  it "should detect dirty words regardless of case" do
    Swearjar.default.profane?('FuCk you jim henson').should be_true
  end
  
  it "should detect simple dirty plurals" do
    Swearjar.default.profane?('jim henson had two dicks').should be_true
    Swearjar.default.profane?('jim henson has two asses').should be_true
  end
  
  it "should not detect non-dirty words" do
    Swearjar.default.profane?('i love you jim henson').should be_false
  end

  it "should give us a scorecard" do
    Swearjar.default.scorecard('fuck you jim henson').should == {:sexual=>1}
  end

  it "should detect multiword" do
    Swearjar.default.scorecard('jim henson has a hard on').should == {:sexual=>1}
  end
  
  it "should detect multiword plurals" do
    Swearjar.default.scorecard('jim henson has a hard ons').should == {:sexual=>1}
  end

  it "should censor a string" do
    Swearjar.default.censor('jim henson has a massive hard on he is gonna use to fuck everybody').should == 'jim henson has a massive **** ** he is gonna use to **** everybody'
  end

end