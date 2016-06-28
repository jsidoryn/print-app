class JobOrg < ActiveRecord::Base
  belongs_to :job
  belongs_to :organisation
end
