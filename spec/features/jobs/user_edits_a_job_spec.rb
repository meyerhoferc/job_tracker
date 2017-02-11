require 'rails_helper'

describe "user edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "StackOverflow")
    job = company.jobs.create!(title: "Rails Developer",
                               description: "do rails things",
                               level_of_interest: 3,
                               city: "Denver")

    visit edit_company_job_path(id: job.id, company_id: company.id)
    fill_in("job[title]", with: "Backend Engineer")
    fill_in("job[description]", with: "do database things")
    click_on("Update Job")

    expect(current_path).to eq(company_job_path(company, job))

    within(".title") do
      expect(page).to have_content("Backend Engineer")
    end

    within(".description") do
      expect(page).to have_content("do database things")
    end
  end
end
