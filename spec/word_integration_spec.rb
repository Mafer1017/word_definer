require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('inputted_word', :with => 'dog')
    click_on('Go!')
    expect(page).to have_content('dog')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    Word.clear()
    word = Word.new("dog", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_phrase', :with => 'an animal that barks.')
    click_on('Add definition')
    expect(page).to have_content('an animal that barks.')
  end
end