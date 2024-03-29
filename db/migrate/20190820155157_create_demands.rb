class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.string :description
      t.integer :status, default: 0
      t.belongs_to :kind, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.datetime :done_at
      t.string :protocol

      t.string :address
      t.string :neighborhood
      t.string :block # Quadra
      t.string :lot # Lote
      t.string :allotment # Loteamento
      t.string :subunit

      t.bigint :current_kind_step_id

      t.timestamps
    end
  end
end
