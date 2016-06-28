class Organisation < ActiveRecord::Base
  has_many :job_orgs
  has_many :jobs, through: :job_orgs

  validates :title, :organisation_type, presence: true

  scope :clients, -> { where(organisation_type: 3) }

  ORG_TYPES = [["Designer", 1], ["Printer", 2], ["Client", 3]]

  def designer?
    organisation_type == 1
  end

  def printer?
    organisation_type == 2
  end

  def client?
    organisation_type == 3
  end
end
