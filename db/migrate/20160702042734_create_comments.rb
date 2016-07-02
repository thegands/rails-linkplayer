class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.references :user, index: true, null: false
      t.references :playlist, index: true, null: false

      t.timestamps
    end
  end
end
