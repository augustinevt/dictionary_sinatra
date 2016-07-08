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

  def self.find(target)
    found_word = nil
    if target.is_a? String
      @@words.each do |word|
        if word.name == target
          found_word = word
        end
      end
    elsif target.is_a? Integer
      @@words.each do |word|
        if word.id == target
          found_word = word
        end
      end
    end
    found_word
  end

  def add_definition(definition)
    @definitions << definition
  end

end
