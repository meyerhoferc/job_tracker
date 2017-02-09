require 'rails_helper'

feature "user deletes an existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "StackOverflow")
    job = company.jobs.create!(title: "Rails Developer",
      description: "do rails things", level_of_interest: 3, city: "Denver")

    visit company_jobs_path(company)
    within(".job_#{job.id}") do
      click_on("Delete")
    end

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Rails Developer was successfully deleted!")
  end
end
