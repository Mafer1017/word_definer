require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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

describe('delete a definition path', {:type => :feature}) do
  it('deletes a definition and then goes to the word page') do
    Word.clear()
    word = Word.new("dog", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_phrase', :with => 'an animal with fur.')
    click_on('Add definition')
    click_on('an animal with fur.')
    click_on('Delete definition')
    expect(page).not_to have_content("an animal with fur")
  end
end

describe('update a definition path', {:type => :feature}) do
  it('updates a definition and then goes to the word page') do
    Word.clear()
    word = Word.new("dog", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_phrase', :with => 'an animal who is furry.')
    click_on('Add definition')
    click_on('an animal who is furry.')
    fill_in('Redefine', :with => 'an animal with four legs.')
    click_on('Update definition')
    expect(page).to have_content("an animal with four legs.")
  end
end