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

describe('delete a word path', {:type => :feature}) do
  it('deletes a word and then goes to the index page') do
    Word.clear()
    word = Word.new("dog", nil)
    word.save
    visit("/words/#{word.id}")
    click_on('Change word')
    click_on('Delete word')
    expect(page).not_to have_content("dog")
  end
end

describe('update a word path', {:type => :feature}) do
  it('updates a word and then goes to that word page') do
    Word.clear()
    word = Word.new("dog", nil)
    word.save
    visit("/words/#{word.id}")
    click_on('Change word')
    fill_in('word', :with => 'cat')
    click_on('Update')
    expect(page).to have_content("cat")
  end
end