class Specification < ActiveRecord::Base
  belongs_to :job
  has_many :quotes, dependent: :destroy
  validates :title, presence: true

  def has_quotes?
    quotes.present?
  end
end
