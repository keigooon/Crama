class Report < ApplicationRecord
  belongs_to :lesson, dependent: :destroy
  accepts_nested_attributes_for :lesson
  
  done_hw = ["完了","途中まで","やってない"]
  validates :content, presence: true  
  validates :exercise, presence: true
  validates :comprehension_lesson, presence: true, inclusion: 1..5
  validates :attitude, presence: true, inclusion: 1..5
  validates :done_homework, presence: true, inclusion: done_hw
  validates :comprehension_homework, presence: true, inclusion: 0..6
  validates :homework, presence: true

end
