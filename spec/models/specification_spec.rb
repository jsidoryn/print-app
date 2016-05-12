require 'rails_helper'

RSpec.describe Specification, type: :model do
  it { should belong_to(:job) }
  it { should have_many(:quotes) }
  it { should validate_presence_of(:title) }
end
