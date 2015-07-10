require 'rails_helper'

describe Comment do
  it { should belong_to :blog }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :user_email }
end
