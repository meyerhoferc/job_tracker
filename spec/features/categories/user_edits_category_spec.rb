require 'rails_helper'

describe "User edits an existing category" do
  it "a user can edit a category" do
    category = Category.create!(title: "Education")

    visit categories_path
    click_on("Edit")

    expect(current_path).to eq(edit_category_path(category))
    expect(Category.count).to eq(1)

    fill_in("category[title]", with: "DevOps")
    click_on("Update")

    expect(Category.count).to eq(1)
    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("DevOps")
  end
end
