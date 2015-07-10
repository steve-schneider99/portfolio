require 'rails_helper'

describe Blog do
  it { should have_many :comments }
  it { should validate_presence_of :post }
  it { should validate_presence_of :category }
end
