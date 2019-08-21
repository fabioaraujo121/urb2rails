class CreateKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :kinds do |t|
      t.string :name
      t.string :nature
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
