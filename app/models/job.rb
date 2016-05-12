class Job < ActiveRecord::Base
  has_many :specifications
  validates :title, presence: true
end
