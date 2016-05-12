require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { should belong_to(:specification) }
  it { should validate_presence_of(:line_item_1) }
  it { should validate_presence_of(:cost_1) }
end
