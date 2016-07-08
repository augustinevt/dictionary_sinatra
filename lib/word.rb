class Word

  attr_accessor :name, :definitions, :id

  @@words = []

  def initialize(options)
    @name = options[:name]
    @definitions = []
    @@words << self
    @id = @@words.length
  end

  def self.all
    @@words
  end

  def self.clear
    @@words = []
  end

  def self.find(target_word)
    found_word = nil
    @@words.each do |word|
      if word.name() == target_word
        found_word = word
      end
    end
    found_word
  end

  def add_definition(definition)
    @definitions << definition
  end

end
