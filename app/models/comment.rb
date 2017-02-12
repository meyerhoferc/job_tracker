class Comment < ActiveRecord::Base
  belongs_to :job
  validates :body, :job, presence: true
end
