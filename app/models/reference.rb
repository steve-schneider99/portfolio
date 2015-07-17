class Reference < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence => true
  validates :comment, :presence => true
  validates :relation, :presence => true
end
