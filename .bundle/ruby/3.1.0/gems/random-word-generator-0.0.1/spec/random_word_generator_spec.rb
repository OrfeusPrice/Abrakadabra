require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.rubyforge.org/
describe "Random word generator" do
  
  it "should be able to generate a random word" do
    RandomWordGenerator.word.should_not be_nil
  end
  
  it "should be able to generate a random word with a specified length" do
    RandomWordGenerator.of_length(4).should_not be_nil
    RandomWordGenerator.of_length(4).size.should == 4
  end
  
  it "should be able to come up with a dummy word if no words with the required length exist" do
    RandomWordGenerator.of_length(55).should_not be_nil
    RandomWordGenerator.of_length(55).size.should == 55
    
    RandomWordGenerator.of_length(2).should_not be_nil
    RandomWordGenerator.of_length(2).size.should == 2
    
    RandomWordGenerator.of_length(0).should_not be_nil
    RandomWordGenerator.of_length(0).size.should == 0
  end
  
end

describe "Random word generator with composed words" do
  
  it "should be able to specify the amount of words" do
    RandomWordGenerator.composed(3, 20).split(' ').size.should == 3
  end
  
  it "should be able to specify the sum of arguments" do
    RandomWordGenerator.composed(3, 20).length.should == 20
    RandomWordGenerator.composed(3, 30).length.should == 30
    RandomWordGenerator.composed(2, 20).length.should == 20
  end
  
  it "should be able separated by a separator" do
    RandomWordGenerator.composed(2, 20).should_not be_nil
    RandomWordGenerator.composed(2, 20).split(' ').size.should == 2
  end
  
  it "should be able to define a custom separator" do
    RandomWordGenerator.composed(2, 20, '-').split('-').size.should == 2
    RandomWordGenerator.composed(3, 20, '-').split('-').size.should == 3
  end
  
end

describe "random word generator database" do
  before(:each) do
    @db = RwdStorage.new
  end
  
  it "should be able to check on the database tables" do
    @db.show_tables.first.should == "wordlist"
  end
  
  it "should be able to be dropped" do
    @db.drop_table
    @db.show_tables.should == []
  end
  
  it "should be able to be recreated" do
    @db.setup_database
    @db.show_tables.first.should == "wordlist"
  end
  
end