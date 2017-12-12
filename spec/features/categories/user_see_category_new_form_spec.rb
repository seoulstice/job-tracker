require 'rails_helper'

describe 'When the user visits the new category page' do
  it 'the user sees the form' do
    visit new_category_path

    expect(current_path).to eq("/categories/new")
    expect(page).to have_content("Create a New Category")
    expect(page).to have_field("category[title]")
  end
end
