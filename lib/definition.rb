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

  def save
    @@definitions[self.id] = Definition.new(self.phrase, self.word_id, self.id)
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