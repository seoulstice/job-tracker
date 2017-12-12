require 'rails_helper'

describe 'When the User visits the new category page' do
  it 'and fills in the form' do
    visit new_category_path

    fill_in('category[title]', with: "Human Resources")
    
    click_link_or_button 'Create Category'

    expect(page).to have_current_path("/categories/#{Category.last.id}")
    expect(page).to have_content("Human Resources")
  end

end
