class AddTagToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tag, :string
  end
end
