require 'rails_helper'

describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        expect(Category.new()).to be_invalid
      end

      it "has a unique title" do
        Category.create(title: "DevOps")
        expect(Category.new(title: "DevOps")).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        expect(Category.new(title: "Web Development")).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      expect(Category.new(title: "InfoSec")).to respond_to(:jobs)
    end
  end
end
