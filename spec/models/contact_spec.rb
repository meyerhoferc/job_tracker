require 'rails_helper'

describe Contact, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(name: "Dropbox")
        contact = Contact.new(position: "Engineer", email: "a@c.com", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        company = Company.new(name: "Dropbox")
        contact = Contact.new(name: "Kurt", email: "k@k.io", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        company = Company.new(name: "Dropbox")
        contact = Contact.new(name: "G", position: "Working", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without a company" do
        contact = Contact.new(name: "K", position: "Working", email: "K2KK@.io")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        company = Company.new(name: "Dropbox")
        contact = Contact.new(name: "Andri",
                              position: "Physicist",
                              email: "greta9a1@erau.edu",
                              company: company)
        expect(contact).to be_valid
      end
    end
  end
end
