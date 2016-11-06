class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :date

      t.timestamps
    end
  end
end
