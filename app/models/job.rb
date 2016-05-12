class Job < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
  validates :title, presence: true
end
