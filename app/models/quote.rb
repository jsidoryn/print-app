class Quote < ActiveRecord::Base
  belongs_to :specification
  validates :printer_name, :line_item_1, :cost_1, presence: true

  monetize :cost_1_cents, :cost_2_cents, :cost_3_cents

  ##
  # What's a better way to do this? Eventually this will be a join table but for now
  # interested in how to handle this

  def total
    result = 0
    (1..3).each do |n|
      v = eval "cost_" + n.to_s
      result += v.to_f
    end
    result
  end
end
