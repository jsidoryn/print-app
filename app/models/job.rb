class Job < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
  validates :title, presence: true

  STATES = %w{ printer_quotes_open printer_quotes_closed client_quotes_open client_quotes_closed }

  STATES.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    define_method("#{state}!") do
      self.update_attribute(:state, state)
    end
  end
end
