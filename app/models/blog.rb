class Blog < ActiveRecord::Base
  has_many :comments
  validates :category, :presence => true
  validates :post, :presence => true
end
