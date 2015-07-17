require 'rails_helper'

describe Reference do
  it { should belong_to :user }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :relation }
  it { should validate_presence_of :user_id }
end
