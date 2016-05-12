class Quote < ActiveRecord::Base
  belongs_to :specification
  validates :line_item_1, :cost_1, presence: true
end
