require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Engineering")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit company_jobs_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "a user enters contact information" do
    company = Company.create!(name: "Disney")
    visit company_jobs_path(company)
    save_and_open_page
    
    expect(Contact.count).to eq(0)

    fill_in("contact[name]", with: "Courtney Meyerhofer")
    fill_in("contact[position]", with: "noob")
    fill_in("contact[email]", with: "anon@gmail.com")
    click_on("Create")

    expect(Contact.count).to eq(1)
    expect(current_path).to eq(company_path(company))
    within('.contacts') do
      expect(page).to have_content("Name: Courtney Meyerhofer")
      expect(page).to have_content("Position: noob")
      expect(page).to have_content("Email: anon@gmail.com")
    end
  end
end
