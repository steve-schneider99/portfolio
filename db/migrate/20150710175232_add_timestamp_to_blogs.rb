class AddTimestampToBlogs < ActiveRecord::Migration
  def change
    add_column(:blogs, :timestamp, :datetime)
  end
end
