class Report < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  
  subjects = ["国語", "算数", "数学", "英語", "理科", "社会",
              "現代文", "古典", "漢文", "小論文",
              "数ⅠA", "数ⅡB", "数Ⅲ",
              "英語長文", "文法",
              "物理", "化学", "生物",
              "地理", "日本史", "世界史", "現代社会", "倫理", "政経", "倫理・政経"]
  check_homework = ["完了", "途中まで", "やってない"]
  
  validates :student_id, presence: true
  validates :lesson_date, presence: true
  validates :subject, presence: true, inclusion: { in: subjects }
  validates :teaching_material, presence: true
  validates :unit, presence: true
  validates :content, presence: true
  validates :exercise, presence: true
  validates :comprehension_lesson, presence: true, inclusion: 1..5
  validates :attitude, presence: true, inclusion: 1..5
  validates :done_homework, presence: true, inclusion: { in: check_homework }
  validates :comprehension_homework, presence: true, inclusion: 0..5
  validates :homework, presence: true
  
end
