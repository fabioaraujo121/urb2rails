class CreateKindStepUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :kind_step_users do |t|
      t.belongs_to :kind_step, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
