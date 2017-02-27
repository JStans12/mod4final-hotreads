require 'rails_helper'

RSpec.describe Read, type: :model do
  it { should validate_presence_of :url }
end
