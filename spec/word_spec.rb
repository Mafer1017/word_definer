require 'rspec'
require 'word'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("dog", nil)
      word.save()
      word2 = Word.new("cat", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Blue", nil)
      word2 = Word.new("Blue", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("frog", nil)
      word.save()
      word2 = Word.new("lizard", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("ball", nil)
      word.save()
      word2 = Word.new("cloud", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
    input = Word.new("boogy", nil)
    input.save()
    input.update("booger")
    expect(input.word).to(eq("booger"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("dog", nil)
      word.save()
      word2 = Word.new("sky", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definition') do
    it("returns a word's definition") do
      Word.clear()
      Definition.clear()
      word = Word.new("Dog", nil)
      word.save()
      definition = Definition.new("An animal that barks", word.id, nil)
      definition.save()
      expect(word.definition).to(eq([definition]))
    end
  end
end