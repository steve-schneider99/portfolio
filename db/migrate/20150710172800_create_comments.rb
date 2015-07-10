class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :comment, :string
      t.column :blog_id, :integer
      t.column :user_id, :integer
      t.timestamp
    end
  end
end
