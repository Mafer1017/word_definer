class Definition
  attr_reader :id
  attr_accessor :phrase, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(phrase, word_id, id)
    @phrase = phrase
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.phrase() == definition_to_compare.phrase()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.phrase, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(phrase, word_id)
    self.phrase = phrase
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.phrase, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions.push(definition)
      end
    end
    definitions
  end
end