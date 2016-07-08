require('rspec')
require('word')

describe Word do

  before() do
    Word.clear()
  end

  describe 'Word#initialize' do
    it 'should have a name when created' do
      new_word = Word.new({name: "Hello"})
      expect(new_word.name()).to eq('Hello')
    end

    it 'should have an empty definitions array value when created' do
      new_word = Word.new({name: "Hello"})
      expect(new_word.definitions()).to eq([])
    end
  end

  describe 'Word#all' do
    it 'should return all word with Word#All' do
      new_word_one = Word.new({name: "Hello"})
      new_word_two = Word.new({name: "Goodby"})
      expect(Word.all()).to eq([new_word_one,new_word_two])
    end
  end

  describe 'Word#find' do
    it 'should return one Word when a word is passed into Word#find' do
      new_word_one = Word.new({name: "Hello"})
      new_word_two = Word.new({name: "Goodby"})
      new_word_two = Word.new({name: "Maharaja"})
      expect(Word.find("Maharaja").id()).to eq(3)
    end
  end

    # xit 'should allow to add definitions with Word#add_definition()' do
    #   new_word = Word.new({name: "Hello"})
    #   new_word.add_definition()
    #   expect(new_word.definitions()).to eq([])
    # end

end
