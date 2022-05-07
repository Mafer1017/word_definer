require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("dog", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("animal that barks", @word.id, nil)
      definition2 = Definition.new("animal that barks", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end
end