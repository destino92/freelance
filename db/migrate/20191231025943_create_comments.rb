class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
