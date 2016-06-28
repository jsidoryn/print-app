class Job < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
  has_many :job_orgs
  has_many :organisations, through: :job_orgs

  validates :title, presence: true

  enum state: {
    printer_quotes_open: 0,
    printer_quotes_closed: 1,
    client_quotes_open: 2,
    client_quotes_closed: 3
  }

end
