class AddExerciseTypeToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :exercise_type, :string
  end
end
