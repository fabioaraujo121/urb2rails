class CreateKindSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :kind_steps do |t|
      t.string :name
      t.boolean :valid_time, default: true
      t.belongs_to :kind, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
