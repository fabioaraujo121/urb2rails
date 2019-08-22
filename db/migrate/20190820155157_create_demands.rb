class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.string :description
      t.integer :status
      t.belongs_to :kind, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
