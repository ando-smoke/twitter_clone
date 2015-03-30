require 'rails_helper'

describe 'the add a new tweet process' do
  it 'displays the form for entering a new tweet', js: true do
    visit tweets_path
    click_on 'New Tweet'
    expect(page).to have_content 'Tweet text'
  end

  it 'adds a new tweet', js: true do
    visit tweets_path
    click_on 'New Tweet'
    fill_in 'Tweet text', with: 'Fiddle-dee-dee'
    click_on 'Create Tweet'
    expect(page).to have_content 'successfully added!'
  end

  it 'gives error when no tweet text is entered', js: true do
    visit tweets_path
    click_on 'New Tweet'
    click_on 'Create Tweet'
    expect(page).to have_content 'Error'
  end
end
