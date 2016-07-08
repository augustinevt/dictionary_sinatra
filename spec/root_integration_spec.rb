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
    new_word_two = Word.new({name: "Goodbye"})
    new_word_two = Word.new({name: "Maharaja"})
    visit('/')
    expect(page).to have_content("Maharaja")
    expect(page).to have_content("Goodbye")
    expect(page).to have_content("Hello")
  end

  it 'should list out all word on index page' do
    new_word_one = Word.new({name: "Hello"})
    new_word_two = Word.new({name: "Goodbye"})
    new_word_three = Word.new({name: "Maharaja"})
    new_definition_one = Definition.new({body: 'A greeting'})
    new_word_one.add_definition(new_definition_one)
    new_word_two.add_definition(new_definition_one)
    new_word_three.add_definition(new_definition_one)
    visit('/')
    click_link('Maharaja')
    expect(page).to have_content("A greeting")
    click_link('Home')
    click_link('Hello')
    expect(page).to have_content("A greeting")
    click_link('Home')
    click_link('Goodbye')
    expect(page).to have_content("A greeting")
  end

end

describe 'word/:id route', {:type => :feature} do

  before() do
    Word.clear()
  end

  it 'should list out all definitions on word page' do
    new_word = Word.new({name: "Maharaja"})
    new_definition_one = Definition.new({body: 'A greeting'})
    new_definition_two = Definition.new({body: 'An alert'})
    new_word.add_definition(new_definition_one)
    new_word.add_definition(new_definition_two)
    visit('/')
    click_link('Maharaja')
    expect(page).to have_content("A greeting")
    expect(page).to have_content("An alert")
  end

end

describe 'new_word route', {:type => :feature} do

  before() do
    Word.clear()
  end

  it 'should create and list out a new word on word page' do
    visit('/')
    fill_in('name', with: "Roast")
    click_button('Add Word')
    expect(page).to have_content("Roast")
  end

end

describe 'new_definition route', {:type => :feature} do

  before() do
    Word.clear()
  end

  it 'should create and list out a new definitions word on /word page' do
    new_word_two = Word.new({name: "Maharaja"})
    visit('/')
    click_link('Maharaja')
    fill_in('definition', with: "A high king")
    click_button('Add Definition')
    expect(page).to have_content("A high king")
  end

end
