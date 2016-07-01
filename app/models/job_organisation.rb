class JobOrganisation < ActiveRecord::Base
  belongs_to :job
  belongs_to :organisation

  def org_title
    "#{organisation.title} (#{job.title})"
  end
end
