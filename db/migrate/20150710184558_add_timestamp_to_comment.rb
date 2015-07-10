class AddTimestampToComment < ActiveRecord::Migration
  def change
    add_column(:comments, :timestamp, :datetime)
  end
end
