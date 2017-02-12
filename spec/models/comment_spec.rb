require 'rails_helper'

describe Comment, type: :model do
  describe "validations" do
    context "it is invalid" do
      it "when it does not have a body" do
        company = Company.create!(name: "ESPN")
        category = Category.create!(title: "DevOps")
        job = company.jobs.create!(title: "Developer",
                                   level_of_interest: 70,
                                   city: "Denver",
                                   category: category)

        expect(Comment.new(job: job)).to be_invalid
      end

      it "when it does not have a job id" do
        expect(Comment.new(body: "crisis mode sos")).to be_invalid
      end
    end

    context "it is valid" do
      it "is valid with a job_id and a body" do
        company = Company.create!(name: "ESPN")
        category = Category.create!(title: "DevOps")
        job = company.jobs.create!(title: "Developer",
                                   level_of_interest: 70,
                                   city: "Denver",
                                   category: category)
        comment = Comment.new(body: "best job evah", job: job)
      end
    end
  end
end
