require('capybara/rspec')
require('./app.rb')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'root route', {:type => :feature} do

  before() do
    Word.clear()
  end

  it 'should list out all word on index page' do
    new_word_one = Word.new({name: "Hello"})
    new_word_two = Word.new({name: "Goodby"})
    new_word_two = Word.new({name: "Maharaja"})
    visit('/')
    expect(page).to have_content("Maharaja")
  end

  it 'should list out all word on index page' do
    new_word_one = Word.new({name: "Hello"})
    new_word_two = Word.new({name: "Goodby"})
    new_word_two = Word.new({name: "Maharaja"})

    new_definition_one = Definition.new({body: 'A greeting'})

    new_word_one.add_definition(new_definition_one)
    new_word_two.add_definition(new_definition_one)
    new_word_two.add_definition(new_definition_one)


    visit('/')
    click_link('Maharaja')
    expect(page).to have_content("A greeting")
  end

end

describe 'word/:id route', {:type => :feature} do

  before() do
    Word.clear()
  end

  it 'should list out definitions word on index page' do
    new_word_one = Word.new({name: "Hello"})
    new_word_two = Word.new({name: "Goodby"})
    new_word_two = Word.new({name: "Maharaja"})
    visit('/')
    expect(page).to have_content("Maharaja")
  end

  it 'should list out all word on index page' do
    new_word_one = Word.new({name: "Hello"})
    new_word_two = Word.new({name: "Goodby"})
    new_word_two = Word.new({name: "Maharaja"})
    visit('/')
    click_link('Maharaja')
    expect(page).to have_content("definitions")
  end

end
