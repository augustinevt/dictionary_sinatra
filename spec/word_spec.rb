require('rspec')
require('word')

describe Word do
  describe 'Word#initialize' do

    it 'should have a name when created' do
      new_word = Word.new({name: "hello"})
      expect(new_word.name()).to eq('hello')
    end

    it 'should have an empty definitions array value when created' do
      new_word = Word.new({name: "hello"})
      expect(new_word.definitions()).to eq([])
    end

  end
end
