require 'rails_helper'

describe "user can see all categories" do
  it "when visiting /categories" do
    category_1 = Category.create!(title: "DevOps")
    category_2 = Category.create!(title: "Education")
    category_3 = Category.create!(title: "Finance")

    visit categories_path

    within("h1") do
      expect(page).to have_content("All Categories")
    end
save_and_open_page
    within(".category_#{category_1.id}") do
      expect(page).to have_content("DevOps")
    end

    within(".category_#{category_3.id}") do
      expect(page).to have_content("Finance")
    end
  end
end
