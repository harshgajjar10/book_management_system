class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.datetime :publish_at

      t.timestamps
    end
  end
end
