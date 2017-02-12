require 'rails_helper'

describe "user goes to a job's show page" do
  it "enters a comment into the comment form" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "DevOps")
    job = company.jobs.create!(title: "Developer",
                               level_of_interest: 70,
                               city: "Denver",
                               category: category)

    expect(Comment.count).to eq(0)

    visit company_job_path(company, job)

    fill_in("comment[body]", with: "Total DREAM JOB ERHMAGERD")
    click_on("Create")

    expect(Comment.count).to eq(1)
    expect(current_path).to eq(job_path(job))

    within(".comments") do
      expect(page).to have_content("Total DREAM JOB ERHMAGERD")
    end
  end
end
