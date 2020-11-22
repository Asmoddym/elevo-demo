class AddCategoryIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :category, index: true, foreign_key: true, default: nil
  end
end
