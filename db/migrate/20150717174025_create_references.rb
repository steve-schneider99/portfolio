class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.column :user_id, :integer
      t.column :comment, :string
      t.column :relation, :string
    end
  end
end
