require 'spec_helper'

describe "AwesomeAnimal.random" do
  it 'returns an awesome animal' do
    AwesomeAnimal::ADJECTIVES = ['awesome']
    AwesomeAnimal::ANIMALS = ['pig']
    AwesomeAnimal.random.should == 'awesome pig'
  end
end
