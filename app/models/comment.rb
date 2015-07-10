class Comment < ActiveRecord::Base
  belongs_to :blog
  validates :comment, :presence => true
  validates :user_email, :presence => true

end
