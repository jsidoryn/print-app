class Quote < ActiveRecord::Base
  belongs_to :specification
  validates :printer_name, :line_item_1, :cost_1_cents, presence: true

  def total
    result = 0
    (1..3).each do |n|
      v = eval "cost_" + n.to_s + "_cents"
      result += v .to_f
    end
    result
  end
end
