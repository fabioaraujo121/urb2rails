class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.belongs_to :kind_step, null: false, foreign_key: true
      t.belongs_to :demand, null: false, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
