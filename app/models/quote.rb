class Quote < ActiveRecord::Base
  belongs_to :specification
  validates :printer_name, :line_item_1, :cost_1, presence: true
end
