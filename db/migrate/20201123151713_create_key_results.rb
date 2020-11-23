class CreateKeyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :key_results do |t|
      t.string :name
      t.integer :weight
      t.belongs_to :objective, foreign_key: true, index: true, default: nil
      t.timestamps
    end
  end
end
