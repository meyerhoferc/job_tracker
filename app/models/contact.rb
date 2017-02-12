class Contact < ActiveRecord::Base
  belongs_to :company
  validates :name, :position, :email, :company, presence: true
end
