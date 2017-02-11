require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in("category[title]", with: "Education")
    click_on("Create")

    expect(current_path).to eq(category_path(Category.last))
    expect(Category.count).to eq(1)
    within(".title") do
      expect(page).to have_content("Education")
    end
  end

  scenario "a user cannot create duplicate categories" do
    Category.create(title: "Education")
    visit new_category_path

    fill_in("category[title]", with: "Education")
    click_on("Create")
    
    expect(Category.count).to eq(1)
  end
end
