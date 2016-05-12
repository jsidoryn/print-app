class Specification < ActiveRecord::Base
  belongs_to :job
  has_many :quotes
  validates :title, presence: true
end
