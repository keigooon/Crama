class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :student, optional: true
  belongs_to :teacher, optional: true
  
  validates :content, presence: true
  validates :question_id, presence: true
end
