class CreatePendings < ActiveRecord::Migration
  def change
    create_table :pendings do |t|
      t.string :task_name
      t.string :task_time_in_minutes
      t.string :status

      t.timestamps null: false
    end
  end
end
