class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :done, default: false
      t.date :day

      t.timestamps
    end
  end
end
