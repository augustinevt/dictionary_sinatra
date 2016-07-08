require('rspec')
require('definition')

describe Definition do

  describe 'Word#initialize' do
    it 'should return value of it\'s body attibute' do
      new_definition = Definition.new({body: 'A large rock'})
      expect(new_definition.body).to eq('A large rock')
    end
  end

end
