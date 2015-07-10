class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.column :post, :string
      t.column :category, :string
      t.timestamp
    end
  end
end
