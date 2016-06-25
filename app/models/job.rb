class Job < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
  validates :title, presence: true

##
  # Using enum for state with a hash so no chance of getting messed up when changing
  # What's the best way to format this? Brackets on new lines?

  enum state: {
    printer_quotes_open: 0,
    printer_quotes_closed: 1,
    client_quotes_open: 2,
    client_quotes_closed: 3
  }
  
end
