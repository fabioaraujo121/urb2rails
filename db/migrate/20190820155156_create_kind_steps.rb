class CreateKindSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :kind_steps do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
