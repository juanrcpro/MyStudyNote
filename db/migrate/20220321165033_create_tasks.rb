class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
