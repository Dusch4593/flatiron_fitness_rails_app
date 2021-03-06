class Routine < ApplicationRecord
  belongs_to :user
  has_many :routine_exercises, dependent: :destroy
  has_many :exercises, through: :routine_exercises
  has_one_attached :image

  validates :name, presence: true

  def self.beginner_level_routines
    where('times_per_week <= 3')
  end

  def self.mid_level_routines
    where('times_per_week <= 4')
  end

  def self.intense_level_routines
    where('times_per_week > 4')
  end

  def exercises_attributes=(exercise)
    if !exercise[:name].blank?
      new_exercise = self.exercises.build
      new_exercise.name = exercise[:name]
      new_exercise.exercise_type = exercise[:exercise_type] if exercise[:exercise_type]
      new_exercise.description = exercise[:description] if exercise[:description]
      new_exercise.image.attach(exercise[:image]) if exercise[:image]
    end
  end
end
