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
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition2 = Definition.new("animal that barks.", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition.save()
      definition2 = Definition.new("animal with fur.", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition.save()
      definition2 = Definition.new("animal that is furry", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition.save()
      definition.update("animal that is furry.", @word.id)
      expect(definition.phrase).to(eq("animal that is furry."))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new("animal that barks.", @word.id, nil)
      definition.save()
      definition2 = Definition.new("animal that is furry", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new("cat", nil)
      word2.save
      definition = Definition.new("animal that is furry", @word.id, nil)
      definition.save()
      definition2 = Definition.new("animal that purrs", word2.id , nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end
end