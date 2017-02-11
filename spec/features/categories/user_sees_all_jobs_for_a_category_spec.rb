require 'rails_helper'

describe "user goes to show page for a category" do
  it "sees all the jobs with that category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "DevOps")
    job1 = company.jobs.create!(title: "Junior Engineer",
                         description: "Learn the backend from experts",
                         level_of_interest: 22,
                         city: "Denver",
                         category: category)
    job2 = company.jobs.create!(title: "Software Engineer",
                         description: "Do database things",
                         level_of_interest: 28,
                         city: "Tucson",
                         category: category)
    job3 = company.jobs.create!(title: "Software Developer",
                         description: "Do software things",
                         level_of_interest: 58,
                         city: "Washington, D.C.",
                         category: category)
    visit category_path(category)
    
    within(".job_#{job1.id}") do
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Junior Engineer")
      expect(page).to have_content("Denver")
    end

    within(".job_#{job3.id}") do
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Software Developer")
      expect(page).to have_content("Washington, D.C.")
    end

    click_on("Junior Engineer")

    expect(current_path).to eq(company_job_path(company, job1))
  end
end
