class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  has_one :report, dependent: :destroy
  
  subjects = ["国語", "数学", "英語", "理科", "社会"]
  
  validates :student_id, presence: true
  validates :lesson_date, presence: true  
  validates :subject, presence: true, inclusion: subjects
  validates :teaching_material, presence: true
  validates :unit, presence: true

end
