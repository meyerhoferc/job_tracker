require 'rails_helper'

describe "User can delete a category" do
  scenario "from the /categories page" do
    Category.create!(title: "Education")
    visit categories_path
    expect(Category.count).to eq(1)
    click_on("Delete")

    expect(Category.count).to eq(0)
    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content("Education")
  end
end
