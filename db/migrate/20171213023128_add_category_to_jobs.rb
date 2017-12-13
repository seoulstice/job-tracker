class AddCategoryToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :category, index: true, foreign_key: true
  end
end
