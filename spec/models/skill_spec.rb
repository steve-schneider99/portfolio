require 'rails_helper'

describe Skill do
  it { should have_many :projects }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
end
