class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
