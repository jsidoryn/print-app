class Quote < ActiveRecord::Base
  belongs_to :specification
  validates :printer_name, :line_item_1, :cost_1, presence: true

  monetize :cost_1_cents, :cost_2_cents, :cost_3_cents, :allow_nil => true

  def total
    (1..3).sum { |n| send("cost_#{n}") }
  end
end
