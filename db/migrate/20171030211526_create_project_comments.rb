class CreateProjectComments < ActiveRecord::Migration[5.1]
  def change
    create_table :project_comments do |t|
      t.text :comment
      t.integer :user_id
      t.bigint :project_id

      t.timestamps
    end
  end
end
