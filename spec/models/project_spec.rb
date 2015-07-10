require 'rails_helper'

describe Project do
  it { should belong_to :skill }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :url }
end
