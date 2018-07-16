class CreateDependents < ActiveRecord::Migration[5.1]
  def change
    create_table :dependents do |t|
      t.string :name,    null: false, default: ""
      t.string :kinship, null: false, default: ""
      t.references :user, index: true

      t.timestamps
    end
  end

  add_foreign_key :dependents, column: :user_id
end
